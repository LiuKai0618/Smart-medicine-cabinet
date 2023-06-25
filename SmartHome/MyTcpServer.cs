using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Web;

namespace SmartHome
{
    public class MyTcpServer
    {
        private static MyTcpServer uniMyTcpServer = null;
        private Socket ServerSocket = null;//服务端  
        public Dictionary<string, MySession> dic_ClientSocket = new Dictionary<string, MySession>();//tcp客户端字典
        private Dictionary<string, Thread> dic_ClientThread = new Dictionary<string, Thread>();//线程字典,每新增一个连接就添加一条线程
        private bool Flag_Listen = true;//监听客户端连接的标志
        //ipport和imei字典
        public Dictionary<string, string> dic_ClientGPSIMEI = new Dictionary<string, string>();
        //存放imei和经纬度的字典
        public Dictionary<string, string> carRunMiles = new Dictionary<string, string>();
        //存放车辆最近一次的位置信息
        public Dictionary<string, int> carLastPosition = new Dictionary<string, int>();
        //----------------------------------------------------------------------------------------------------------------------//
        public static MyTcpServer GetInstance()
        {
            if (null == uniMyTcpServer)
            {
                uniMyTcpServer = new MyTcpServer();
            }
            return uniMyTcpServer;
        }
        public bool OpenServer()
        {
            //将mms2rtu每一行的connectsate为on的改为off
            //DAL.MMS2RTUDAL mms2rtudal = new DAL.MMS2RTUDAL();
            //List<Model.MMS2RTU> list = mms2rtudal.GetList();
            //for (int i = 0; i < list.Count; i++)
            //{
            //    if (list[i].ConnectState == "ON")
            //    {
            //        list[i].ConnectState = "OFF";
            //        list[i].DateTime = System.DateTime.Now.ToString();
            //        mms2rtudal.EditMMS2RTU(list[i]);
            //    }                
            //}

            try
            {
                Flag_Listen = true;
                // 创建负责监听的套接字，注意其中的参数；
                ServerSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
                // 创建包含ip和端口号的网络节点对象；
                //IPEndPoint endPoint = new IPEndPoint(IPAddress.Parse("0.0.0.0"), 6966);
                IPEndPoint endPoint = new IPEndPoint(IPAddress.Any, 6966);
                //IPEndPoint endPoint = new IPEndPoint(IPAddress.Parse("112.253.35.82"), port);
                //IPEndPoint endPoint = new IPEndPoint(IPAddress.Any, port);
                try
                {
                    // 将负责监听的套接字绑定到唯一的ip和端口上；
                    ServerSocket.Bind(endPoint);
                }
                catch
                {
                    return false;
                }
                // 设置监听队列的长度；
                ServerSocket.Listen(100);
                // 创建负责监听的线程；
                Thread Thread_ServerListen = new Thread(ListenConnecting);
                Thread_ServerListen.IsBackground = true;
                Thread_ServerListen.Start();

                return true;
            }
            catch
            {
                return false;
            }
        }
        public void CloseServer()
        {
            //将mms2rtu每一行的connectsate设置为off
            //DAL.MMS2RTUDAL mms2rtudal = new DAL.MMS2RTUDAL();
            //List<Model.MMS2RTU> list = mms2rtudal.GetList();
            //for (int i = 0; i < list.Count; i++)
            //{
            //    list[i].ConnectState = "OFF";
            //    list[i].DateTime = System.DateTime.Now.ToString();
            //    mms2rtudal.EditMMS2RTU(list[i]);

            //}
            //before
            // 将gps设备字典清空
            dic_ClientGPSIMEI.Clear();

            lock (dic_ClientSocket)
            {
                foreach (var item in dic_ClientSocket)
                {
                    item.Value.Close();//关闭每一个连接
                }
                dic_ClientSocket.Clear();//清除字典
            }
            lock (dic_ClientThread)
            {
                foreach (var item in dic_ClientThread)
                {
                    item.Value.Abort();//停止线程
                }
                dic_ClientThread.Clear();
            }
            Flag_Listen = false;
            //ServerSocket.Shutdown(SocketShutdown.Both);//服务端不能主动关闭连接,需要把监听到的连接逐个关闭
            if (ServerSocket != null)
                ServerSocket.Close();

        }
        private void ListenConnecting()
        {
            while (Flag_Listen)  // 持续不断的监听客户端的连接请求；
            {
                try
                {
                    Socket sokConnection = ServerSocket.Accept(); // 一旦监听到一个客户端的请求，就返回一个与该客户端通信的 套接字；
                    // 将与客户端连接的 套接字 对象添加到集合中；
                    string str_EndPoint = sokConnection.RemoteEndPoint.ToString();
                    //只要一连接上马上显示连接状态为on(不合适？？？？)                   
                    //DAL.MMS2RTUDAL mms2rtudal = new DAL.MMS2RTUDAL();
                    //Model.MMS2RTU temp = mms2rtudal.GetMMS2RTUbyClientPoint(str_EndPoint);
                    //if (temp != null)
                    //{
                    //    //edit
                    //    temp.DateTime = System.DateTime.Now.ToString();
                    //    temp.ConnectState = "ON";
                    //    mms2rtudal.EditMMS2RTU(temp);
                    //}

                    MySession myTcpClient = new MySession() { TcpSocket = sokConnection };
                    //创建线程接收数据
                    Thread th_ReceiveData = new Thread(ReceiveData);
                    th_ReceiveData.IsBackground = true;
                    th_ReceiveData.Start(myTcpClient);
                    //把线程及客户连接加入字典
                    dic_ClientThread.Add(str_EndPoint, th_ReceiveData);
                    dic_ClientSocket.Add(str_EndPoint, myTcpClient);
                }
                catch
                {

                }
                Thread.Sleep(200);
            }
        }
        private void ReceiveData(object sokConnectionparn)
        {
            MySession tcpClient = sokConnectionparn as MySession;
            Socket socketClient = tcpClient.TcpSocket;
            bool Flag_Receive = true;

            while (Flag_Receive)
            {
                try
                {
                    // 定义一个2M的缓存区；
                    byte[] arrMsgRec = new byte[1024 * 1024 * 2];
                    // 将接受到的数据存入到输入  arrMsgRec中；
                    int length = -1;
                    try
                    {
                        length = socketClient.Receive(arrMsgRec); // 接收数据，并返回数据的长度；
                    }
                    catch
                    {
                        Flag_Receive = false;

                        //断开客户端的连接，修改mms2rtu
                        //DAL.MMS2RTUDAL mms2rtudal = new DAL.MMS2RTUDAL();
                        //Model.MMS2RTU temp = mms2rtudal.GetMMS2RTUbyClientPoint(socketClient.RemoteEndPoint.ToString());
                        //if (temp != null)
                        //{
                        //    //edit
                        //    temp.DateTime = System.DateTime.Now.ToString();
                        //    temp.ConnectState = "OFF";
                        //    mms2rtudal.EditMMS2RTU(temp);
                        //}
                        //if(dic_ClientGPSIMEI.ContainsKey())


                        // 从通信线程集合中删除被中断连接的通信线程对象；
                        string keystr = socketClient.RemoteEndPoint.ToString();
                        dic_ClientSocket.Remove(keystr);//删除客户端字典中该socket
                        try
                        {
                            dic_ClientThread[keystr].Abort();//关闭线程
                        }
                        catch
                        {
                        }

                        finally
                        {
                            dic_ClientThread.Remove(keystr);//删除字典中该线程   
                            tcpClient = null;
                            socketClient = null;
                        }
                        //dic_ClientThread[keystr].Abort();//关闭线程
                        //dic_ClientThread.Remove(keystr);//删除字典中该线程   
                        //tcpClient = null;
                        //socketClient = null;
                        //break;
                    }
                    //客户端主动断开与服务器的连接
                    if (length == 0)
                    {
                        Flag_Receive = false;


                        //断开客户端的连接，修改mms2rtu
                        //DAL.MMS2RTUDAL mms2rtudal = new DAL.MMS2RTUDAL();
                        //Model.MMS2RTU temp = mms2rtudal.GetMMS2RTUbyClientPoint(socketClient.RemoteEndPoint.ToString());
                        //if (temp != null)
                        //{
                        //    //edit
                        //    temp.DateTime = System.DateTime.Now.ToString();
                        //    temp.ConnectState = "OFF";
                        //    mms2rtudal.EditMMS2RTU(temp);
                        //}

                        // 从通信线程集合中删除被中断连接的通信线程对象；
                        string keystr = socketClient.RemoteEndPoint.ToString();
                        dic_ClientSocket.Remove(keystr);//删除客户端字典中该socket
                        try
                        {
                            dic_ClientThread[keystr].Abort();//关闭线程
                        }
                        catch
                        {
                        }
                        finally
                        {
                            dic_ClientThread.Remove(keystr);//删除字典中该线程
                            tcpClient = null;
                            socketClient = null;                            
                        }
                        //dic_ClientThread.Remove(keystr);//删除字典中该线程
                        //tcpClient = null;
                        //socketClient = null;
                        //break;
                    }
                    byte[] buf = new byte[length];
                    Array.Copy(arrMsgRec, buf, length);
                    lock (tcpClient.m_Buffer)
                    {
                        //处理GPSdata
                        ProcessGPSData(buf, socketClient.RemoteEndPoint.ToString());
                        tcpClient.AddQueue(buf);

                        //此处可以接受数据串并处理数据了
                        //string temp = System.Text.Encoding.UTF8.GetString(buf);
                        ////Console.WriteLine(temp);
                        //SaveDatabase(temp, socketClient.RemoteEndPoint.ToString());
                        //tcpClient.AddQueue(buf);

                    }
                }
                catch
                {

                }
                Thread.Sleep(100);
            }
        }
        //通过IMEI拿到车牌号
        public static string plateNumberByIMEI(string imei)
        {
            if (imei == "0868120253315557")
            {
                return "蒙E9390B";
            }
            else if (imei == "0868120253317967")
            {
                return "蒙E7560P";
            }
            else if (imei == "0868120253317975")
            {
                return "蒙EFQ920";
            }
            else if (imei == "0868120253318031")
            {
                return "蒙E1759P";
            }
            else if (imei == "0868120247900787")
            {
                return "鲁A66666";
            }
            else if (imei == "0868120253318080")
            {
                return "蒙E0373F";
            }
            else if (imei == "0868120253315532")
            {
                return "蒙E1795P";
            }
            else if (imei == "0868120253320144")
            {
                return "蒙E2338M";
            }
            else if (imei == "0868120253317983")
            {
                return "蒙E2809N";
            }
            else if (imei == "0868120253315474")
            {
                return "蒙E2750N";
            }
            else if (imei == "0868120253315573")
            {
                return "蒙EHD909";
            }
            else
            {
                return "未知车牌";
            }           
        }
        //bytes[i].ToString("X2");
        //处理GPSdata
        public void ProcessGPSData(byte[] receiveBytes,string endpoint)
        {
            if (Crc.IsCrcGoodByAllBytes(receiveBytes))
            {
                if (Convert.ToInt32(receiveBytes[3]) == 1)
                {
                    //提取IMEI，从index第四个字节开始，提取8个字节
                    StringBuilder sb = new StringBuilder();
                    sb.Append(receiveBytes[4].ToString("X2"));
                    sb.Append(receiveBytes[5].ToString("X2"));
                    sb.Append(receiveBytes[6].ToString("X2"));
                    sb.Append(receiveBytes[7].ToString("X2"));
                    sb.Append(receiveBytes[8].ToString("X2"));
                    sb.Append(receiveBytes[9].ToString("X2"));
                    sb.Append(receiveBytes[10].ToString("X2"));
                    sb.Append(receiveBytes[11].ToString("X2"));
                    //保存到字典中
                    dic_ClientGPSIMEI.Add(endpoint,sb.ToString());
                    //增加一个新的gps数据表
                    Model.GPSIMEI gpsimei = new Model.GPSIMEI();
                    gpsimei.IMEI = sb.ToString();
                    new DAL.GPSIMEIDAL().AddGPSIMEITable(gpsimei);

                    //登录包
                    int totalLength = Convert.ToInt32(receiveBytes[2]) + 5;
                    byte xuliehao1 = receiveBytes[totalLength - 6];
                    byte xuliehao2 = receiveBytes[totalLength - 5];
                    byte[] sendBytes = new byte[] { 0x78, 0x78, 0x05, 0x01, xuliehao1, xuliehao2, 0x00, 0x00, 0x0d, 0x0a };
                    Crc.AutoFillXorBytes(sendBytes);
                    SendData(endpoint, sendBytes);

                }
                else if (Convert.ToInt32(receiveBytes[3]) == 19)
                {
                    //ID, IPPort, IMEI, GasElectricSwitch, LocationSwitch, Charging, ACC, Garrison, PowerLevel, SignalIntensity, DateTime
                    Model.GPSStates gpsstates = new Model.GPSStates();
                    gpsstates.IPPort = endpoint;
                    gpsstates.IMEI = dic_ClientGPSIMEI[endpoint];
                    //bit8 = byte1 & 128 == 128 ? 1 : 0; 
                    gpsstates.GasElectricSwitch = (receiveBytes[4] & 128) == 128 ? "油电断开" : "油电接通";
                    gpsstates.LocationSwitch = (receiveBytes[4] & 64) == 64 ? "GPS已定位" : "GPS未定位";
                    gpsstates.Charging = (receiveBytes[4] & 4) == 4 ? "已接电源充电" : "未接电源充电";
                    gpsstates.ACC = (receiveBytes[4] & 2) == 2 ? "ACC高" : "ACC低";
                    gpsstates.Garrison = (receiveBytes[4] & 1) == 1 ? "设防" : "撤防";

                    int powerlever = Convert.ToInt32(receiveBytes[5]);
                    if (powerlever == 0) { gpsstates.PowerLevel = "无电"; }
                    else if (powerlever == 1) { gpsstates.PowerLevel = "电量极低"; }
                    else if (powerlever == 2) { gpsstates.PowerLevel = "电量很低"; }
                    else if (powerlever == 3) { gpsstates.PowerLevel = "电量低"; }
                    else if (powerlever == 4) { gpsstates.PowerLevel = "电量中"; }
                    else if (powerlever == 5) { gpsstates.PowerLevel = "电量高"; }
                    else if (powerlever == 6) { gpsstates.PowerLevel = "电量极高"; }

                    int signal = Convert.ToInt32(receiveBytes[6]);
                    if (signal == 0) { gpsstates.SignalIntensity = "无信号"; }
                    else if (signal == 1) { gpsstates.SignalIntensity = "信号极弱"; }
                    else if (signal == 2) { gpsstates.SignalIntensity = "信号较弱"; }
                    else if (signal == 3) { gpsstates.SignalIntensity = "信号良好"; }
                    else if (signal == 4) { gpsstates.SignalIntensity = "信号强"; }

                    gpsstates.DateTime = DateTime.Now.ToString();

                    DAL.GPSStatesDAL gpsstatesdal = new DAL.GPSStatesDAL();
                    if (gpsstatesdal.GetGPSStates(gpsstates.IMEI) != null) { gpsstatesdal.EditGPSStates(gpsstates); }
                    else { gpsstatesdal.AddGPSStates(gpsstates); }

                    //心跳包
                    int totalLength = Convert.ToInt32(receiveBytes[2]) + 5;
                    byte xuliehao1 = receiveBytes[totalLength - 6];
                    byte xuliehao2 = receiveBytes[totalLength - 5];
                    byte[] sendBytes = new byte[] { 0x78, 0x78, 0x05, 0x13, xuliehao1, xuliehao2, 0x00, 0x00, 0x0d, 0x0a };
                    Crc.AutoFillXorBytes(sendBytes);
                    SendData(endpoint, sendBytes);

                }
                else if (Convert.ToInt32(receiveBytes[3]) == 34)
                {
                    //ID, IMEI, DateTime, Latitude, Longitude, Speed, RealTimeLocation, IsLocated, LongitudeEastWest, LatitudeSouthNorth, 
                    //Direction, ACC, UploadMode, RealTimeOrSupply, AccumulatedMiles
                    Model.GPSIMEI gpsimei = new Model.GPSIMEI();
                    gpsimei.IMEI = dic_ClientGPSIMEI[endpoint];

                    //小时需要加上8，东八区
                    //如果时，分，是1位，则补0，变成两位
                    int yearint = Convert.ToInt32(receiveBytes[4]) + 2000;
                    int monthint = Convert.ToInt32(receiveBytes[5]);
                    int dateint = Convert.ToInt32(receiveBytes[6]);
                    int hourint = Convert.ToInt32(receiveBytes[7]);
                    int minuteint = Convert.ToInt32(receiveBytes[8]);
                    int secondint = Convert.ToInt32(receiveBytes[9]);

                    //int hournew = (hourint + 8) % 24;
                    //int datenew = dateint + (hourint + 8) / 24;
                    //int mou=date
                    //DateTime gpsdatetime = new DateTime(yearint,monthint,dateint,hourint,minuteint,secondint);
                    DateTime gpsdatetime = new DateTime(yearint, monthint, dateint, hourint, minuteint, secondint);
                    DateTime beijingtime = gpsdatetime.AddHours(8);



                    //string mintemp = Convert.ToInt32(receiveBytes[8]).ToString();
                    //if (mintemp.Length == 1) { mintemp = "0" + mintemp; }
                    //string sectemp = Convert.ToInt32(receiveBytes[9]).ToString();
                    //if (sectemp.Length == 1) { sectemp = "0" + sectemp; }

                    //gpsimei.DateTime = "20"+Convert.ToInt32(receiveBytes[4]).ToString()+"/"+ Convert.ToInt32(receiveBytes[5]).ToString() + "/" + Convert.ToInt32(receiveBytes[6]).ToString() + " " + ((Convert.ToInt32(receiveBytes[7])+8)%24).ToString() + ":" + mintemp + ":" + sectemp;
                    gpsimei.DateTime = beijingtime.ToString();

                    //gpsimei.Latitude = (Convert.ToDouble(BitConverter.ToUInt32(receiveBytes, 11)) / 1800000).ToString();
                    //gpsimei.Longitude = (Convert.ToDouble(BitConverter.ToUInt32(receiveBytes, 15)) / 1800000).ToString();
                    //gpsimei.Latitude = (Convert.ToDouble(Convert.ToInt32(receiveBytes[14] << 24 + receiveBytes[13] << 16 + receiveBytes[12] << 8 + receiveBytes[11])) / 1800000).ToString();
                    //gpsimei.Longitude = (Convert.ToDouble(Convert.ToInt32(receiveBytes[18] << 24 + receiveBytes[17] << 16 + receiveBytes[16] << 8 + receiveBytes[15])) / 1800000).ToString();
                    int one = receiveBytes[11] << 24;
                    int two = receiveBytes[12] << 16;
                    int three = receiveBytes[13] << 8;
                    int four = receiveBytes[14];
                    int latitudeint = one + two + three + four;
                    double latitudedouble = Convert.ToDouble(latitudeint);
                    double latitudetemp = latitudedouble / 1800000;
                    gpsimei.Latitude = latitudetemp.ToString();

                    int one1 = receiveBytes[15] << 24;
                    int two1 = receiveBytes[16] << 16;
                    int three1 = receiveBytes[17] << 8;
                    int four1 = receiveBytes[18];
                    int longitudeint = one1 + two1 + three1 + four1;
                    double longitudedouble = Convert.ToDouble(longitudeint);
                    double longitudetemp = longitudedouble / 1800000;
                    gpsimei.Longitude = longitudetemp.ToString();

                    //--------------------经纬度坐标http请求转换--------------------//
                    //http://api.map.baidu.com/geoconv/v1/?coords=114.21892734521,29.575429778924&from=1&to=5&ak=8MZLMmFUIhAg2sI7ITa5RlsR6KEZdzAG
                    string urltemp = "http://api.map.baidu.com/geoconv/v1/?coords="+ gpsimei.Longitude + ","+ gpsimei.Latitude + "&from=1&to=5&ak=8MZLMmFUIhAg2sI7ITa5RlsR6KEZdzAG";
                    string[] res = HttpClientHelper.GetResponse(urltemp).Split('*');
                    gpsimei.Longitude = res[0];
                    gpsimei.Latitude = res[1];
                    //--------------------经纬度坐标http请求转换--------------------//

                    //------------------------------计算经纬度两点之间的距离，并更新数据库-------------------------------------------------------------------------------//
                    if (carRunMiles.ContainsKey(gpsimei.IMEI))
                    {
                        string latlng = carRunMiles[gpsimei.IMEI];
                        string[] temp = latlng.Split('*');
                        //string latOld = temp[0];
                        //string lngOld = temp[1];
                        double distance = mapDistance1.GetDistance(Convert.ToDouble(temp[0]), Convert.ToDouble(temp[1]), Convert.ToDouble(gpsimei.Latitude), Convert.ToDouble(gpsimei.Longitude));
                        //读取数据库的距离值，更新后上传
                        Third.CarInforDAL cardal = new Third.CarInforDAL();
                        Third.CarInfor car = cardal.GetCarbyPlateNumber(plateNumberByIMEI(gpsimei.IMEI));
                        if (car != null)
                        {
                            int oldMiles = Convert.ToInt32(car.runMiles);
                            car.runMiles = (oldMiles + Convert.ToInt32(distance)).ToString();
                            cardal.EditCar(car);
                        }

                        //更新字典
                        carRunMiles[gpsimei.IMEI] = gpsimei.Latitude + "*" + gpsimei.Longitude;
                    }
                    else
                    {
                        carRunMiles.Add(gpsimei.IMEI, gpsimei.Latitude+"*"+ gpsimei.Longitude);
                    }
                    //----------------------------------计算距离所属医院的距离，计算出行次数-----------------------------------------------------------------------//
                    double tempDistance;
                    if (gpsimei.IMEI == "0868120253315557")
                    {
                        tempDistance = mapDistance1.GetDistance(Convert.ToDouble("48.214831"), Convert.ToDouble("118.252051"), Convert.ToDouble(gpsimei.Latitude), Convert.ToDouble(gpsimei.Longitude));
                    }
                    else if (gpsimei.IMEI == "0868120253318031")
                    {
                        tempDistance = mapDistance1.GetDistance(Convert.ToDouble("48.482403"), Convert.ToDouble("118.244368"), Convert.ToDouble(gpsimei.Latitude), Convert.ToDouble(gpsimei.Longitude));
                    }
                    else if (gpsimei.IMEI == "0868120253317967")
                    {
                        tempDistance = mapDistance1.GetDistance(Convert.ToDouble("48.318963"), Convert.ToDouble("118.587308"), Convert.ToDouble(gpsimei.Latitude), Convert.ToDouble(gpsimei.Longitude));
                    }
                    else if (gpsimei.IMEI == "0868120253317975")
                    {
                        tempDistance = mapDistance1.GetDistance(Convert.ToDouble("48.814551"), Convert.ToDouble("118.405940"), Convert.ToDouble(gpsimei.Latitude), Convert.ToDouble(gpsimei.Longitude));
                    }
                    //-----------------------------------新增6辆车-------------------------------------------------------------------------------------------
                    else if (gpsimei.IMEI == "0868120253318080")//117.817986,48.073333
                    {
                        tempDistance = mapDistance1.GetDistance(Convert.ToDouble("48.073333"), Convert.ToDouble("117.817986"), Convert.ToDouble(gpsimei.Latitude), Convert.ToDouble(gpsimei.Longitude));
                    }
                    else if (gpsimei.IMEI == "0868120253315532")//118.109420,49.263761
                    {
                        tempDistance = mapDistance1.GetDistance(Convert.ToDouble("49.263761"), Convert.ToDouble("118.109420"), Convert.ToDouble(gpsimei.Latitude), Convert.ToDouble(gpsimei.Longitude));
                    }
                    else if (gpsimei.IMEI == "0868120253320144")//119.446551,47.470373
                    {
                        tempDistance = mapDistance1.GetDistance(Convert.ToDouble("47.470373"), Convert.ToDouble("119.446551"), Convert.ToDouble(gpsimei.Latitude), Convert.ToDouble(gpsimei.Longitude));
                    }
                    else if (gpsimei.IMEI == "0868120253317983")//117.774274,48.971426
                    {
                        tempDistance = mapDistance1.GetDistance(Convert.ToDouble("48.971426"), Convert.ToDouble("117.774274"), Convert.ToDouble(gpsimei.Latitude), Convert.ToDouble(gpsimei.Longitude));
                    }
                    else if (gpsimei.IMEI == "0868120253315474")//119.484789,47.842308
                    {
                        tempDistance = mapDistance1.GetDistance(Convert.ToDouble("47.842308"), Convert.ToDouble("119.484789"), Convert.ToDouble(gpsimei.Latitude), Convert.ToDouble(gpsimei.Longitude));
                    }
                    else if (gpsimei.IMEI == "0868120253315573")//119.484864,47.84237
                    {
                        tempDistance = mapDistance1.GetDistance(Convert.ToDouble("47.84237"), Convert.ToDouble("119.484864"), Convert.ToDouble(gpsimei.Latitude), Convert.ToDouble(gpsimei.Longitude));
                    }

                    //-----------------------------------新增6辆车-------------------------------------------------------------------------------------------
                    else
                    {
                        //随便取一个经纬度坐标
                        tempDistance = mapDistance1.GetDistance(Convert.ToDouble("48.214831"), Convert.ToDouble("118.252051"), Convert.ToDouble(gpsimei.Latitude), Convert.ToDouble(gpsimei.Longitude));
                    }
                    int newPositionInt;
                    if (tempDistance > 2000) { newPositionInt = 1; }
                    else { newPositionInt = 0; }
                    //----------------------------------------------------------------------------------------------------------//
                    if (carLastPosition.ContainsKey(gpsimei.IMEI))
                    {
                        int oldPositionInt = carLastPosition[gpsimei.IMEI];
                        if ((oldPositionInt == 1 )&& (newPositionInt == 0))
                        {
                            Third.CarInforDAL cardal = new Third.CarInforDAL();
                            //出行次数要+1
                            Third.CarInfor car = cardal.GetCarbyPlateNumber(plateNumberByIMEI(gpsimei.IMEI));
                            if (car != null)
                            {
                                int oldcount = Convert.ToInt32(car.visitCount);
                                car.visitCount = (oldcount+1).ToString();
                                cardal.EditCar(car);
                            }

                        }
                        carLastPosition[gpsimei.IMEI] = newPositionInt;
                    }
                    else
                    {
                        carLastPosition.Add(gpsimei.IMEI, newPositionInt);
                    }

                    //if (tempIMEI == "0868120253315557") {
                    //    //蒙E9390B 锡林社区卫生服务中心 0868120253315557
                    //    startPoint = new BMapGL.Point(118.252051, 48.214831);
                    //}
                    //else if (tempIMEI == "0868120253318031") {
                    //    startPoint = new BMapGL.Point(118.244368, 48.482403);
                    //}
                    //else if (tempIMEI == "0868120253317967") {
                    //    startPoint = new BMapGL.Point(118.587308, 48.318963);
                    //}
                    //else if (tempIMEI == "0868120253317975") {
                    //    startPoint = new BMapGL.Point(118.405940, 48.814551);
                    //}
                    //---------------------------------------------------------------------------------------------------//
                    //---------------------------------------------------------------------------------------------------//
                    gpsimei.Speed = Convert.ToInt32(receiveBytes[19]).ToString();

                    gpsimei.RealTimeLocation = (receiveBytes[20] & 32) == 32 ? "差分定位" : "实时定位";
                    gpsimei.IsLocated = (receiveBytes[20] & 16) == 16 ? "已定位" : "无定位";
                    gpsimei.LongitudeEastWest = (receiveBytes[20] & 8) == 8 ? "西经" : "东经";
                    gpsimei.LatitudeSouthNorth = (receiveBytes[20] & 4) == 4 ? "北纬" : "南纬";

                    int degree = (receiveBytes[20] & 2) * 512 + (receiveBytes[20] & 1) * 256 + Convert.ToInt32(receiveBytes[21]);
                    string dir = "";
                    if (degree < 23) { dir = "北"; }
                    else if (degree < 67) { dir = "东北"; }
                    else if (degree < 112) { dir = "东"; }
                    else if (degree < 157) { dir = "东南"; }
                    else if (degree < 202) { dir = "南"; }
                    else if (degree < 247) { dir = "西南"; }
                    else if (degree < 292) { dir = "西"; }
                    else if (degree < 337) { dir = "西北"; }
                    else { dir = "北"; }



                    gpsimei.Direction = dir;



                    gpsimei.ACC = Convert.ToInt32(receiveBytes[30]) == 0 ? "ACC低" : "ACC高";

                    string uploadmode = "";
                    int uploadmodeint = Convert.ToInt32(receiveBytes[31]);
                    if (uploadmodeint == 0) { uploadmode = "定时上报"; }
                    else if (uploadmodeint == 1) { uploadmode = "定距上报"; }
                    else if (uploadmodeint == 2) { uploadmode = "拐点上报"; }
                    else if (uploadmodeint == 3) { uploadmode = "ACC状态改变上传"; }
                    else if (uploadmodeint == 4) { uploadmode = "从运动变为静止状态后，补传最后一个定位点"; }
                    else if (uploadmodeint == 5) { uploadmode = "网络断开重连后，上报之前最后一个有效上传点"; }
                    else if (uploadmodeint == 6) { uploadmode = "上报模式：星历更新强制上传GPS点"; }
                    else if (uploadmodeint == 7) { uploadmode = "上报模式：按键上传定位点"; }
                    else if (uploadmodeint == 8) { uploadmode = "上报模式：开机上报位置信息"; }
                    else if (uploadmodeint == 9) { uploadmode = "上报模式：未使用"; }
                    else if (uploadmodeint == 10) { uploadmode = "上报模式：设备静止后上报最后的经纬度，但时间更新"; }
                    else if (uploadmodeint == 11) { uploadmode = "WIFI解析经纬度上传包"; }
                    else if (uploadmodeint == 12) { uploadmode = "上报模式：LJDW（立即定位）指令上报"; }
                    else if (uploadmodeint == 13) { uploadmode = "上报模式：设备静止后上报最后的经纬度"; }
                    else if (uploadmodeint == 14) { uploadmode = "上报模式：GPSDUP上传（下静止状态定时上传）"; }
                    gpsimei.UploadMode = uploadmode;

                    //gpsimei.UploadMode = Convert.ToInt32(receiveBytes[31]) == 0 ? "定时上报" : "其它方式";


                    gpsimei.RealTimeOrSupply = Convert.ToInt32(receiveBytes[32]) == 0 ? "定时上传" : "补传";
                    //gpsimei.AccumulatedMiles = BitConverter.ToUInt32(receiveBytes, 33)+"米";
                    //gpsimei.AccumulatedMiles = Convert.ToInt32(receiveBytes[36] << 24 + receiveBytes[35] << 16 + receiveBytes[34] << 8 + receiveBytes[33]).ToString() + "米";
                    //gpsimei.AccumulatedMiles = "当前设备无此功能";
                    gpsimei.AccumulatedMiles = DateTime.Now.ToString() ;

                    new DAL.GPSIMEIDAL().AddGPSIMEIData(gpsimei);
                    //gps定位包
                    //byte[] ppp = receiveBytes;
                }
            }
        }
        //public void SaveDatabase(string str,string clientPoint)
        //{
        //    //ID, RTUID, Password, SwitchState, SwitchStyle, UpInterval, MaxCurrent, MinVoltage, MaxVoltage, 
        //    //Frequency, DutyRatio, OpenTime, OpenAngle, ClientPoint, DateTime, NowVoltage, NowCurrent
        //    int start = str.IndexOf('$');
        //    int end = str.IndexOf('*');
        //    if (start == -1) { return; }
        //    if (end == -1) { return; }
        //    if (start >= end) { return; }
        //    string str1 = str.Substring(start + 1, end - start - 1);
        //    string[] strs = str1.Split(',');
        //    if (strs.Length != 15) { return; }
        //    //对每个分片存储数据库之前做强壮性判断
        //    if (!new Regex(@"^\d{11}$").IsMatch(strs[1])) { return; }
        //    if (!new Regex(@"^\d{6}$").IsMatch(strs[2])) { return; }
        //    //N-初始、O-开启、C-关闭、S-停止、A-超时自动停止。
        //    if (!new Regex(@"^[NOCSA]{1}$").IsMatch(strs[3])) { return; }
        //    if (!new Regex(@"^\d{1}$").IsMatch(strs[4])) { return; }
        //    if (!new Regex(@"^[0-9A-F]{2}$").IsMatch(strs[5])) { return; }
        //    if (!new Regex(@"^\d{3}$").IsMatch(strs[6])) { return; }
        //    if (!new Regex(@"^\d{3}$").IsMatch(strs[7])) { return; }
        //    if (!new Regex(@"^\d{3}$").IsMatch(strs[8])) { return; }
        //    if (!new Regex(@"^\d{2}$").IsMatch(strs[9])) { return; }

        //    if (!new Regex(@"^\d{3}$").IsMatch(strs[10])) { return; }
        //    if (Convert.ToInt32(strs[10]) > 100) { return; }

        //    if (!new Regex(@"^\d{3}$").IsMatch(strs[11])) { return; }

        //    if (!new Regex(@"^\d{3}$").IsMatch(strs[12])) { return; }
        //    if (Convert.ToInt32(strs[12]) > 100) { return; }

        //    if (!new Regex(@"^\d{3}$").IsMatch(strs[13])) { return; }
        //    if (!new Regex(@"^\d{3}$").IsMatch(strs[14])) { return; }

        //    //对分片做校验判断
        //    char[] pureChars = str1.ToCharArray();
        //    byte xorbyte = 0;
        //    for (int i = 0; i < pureChars.Length; i++)
        //    {
        //        xorbyte ^= (byte)pureChars[i];
        //    }
        //    //string xorstring = Convert.ToString(xorbyte, 16).ToUpper();
        //    string xorstring = xorbyte.ToString("X2").ToUpper();
        //    string recxor=str.Substring(end+1, 2);
        //    if (!(recxor.Equals(xorstring))) { return; }

        //    Model.RTU2MMS rtu2mms = new Model.RTU2MMS();
        //    rtu2mms.RTUID = strs[1];
        //    rtu2mms.Password = strs[2];
        //    rtu2mms.SwitchState = strs[3];
        //    rtu2mms.SwitchStyle = strs[4];
        //    rtu2mms.UpInterval = strs[5];
        //    rtu2mms.MaxCurrent = strs[6];
        //    rtu2mms.MinVoltage = strs[7];
        //    rtu2mms.MaxVoltage = strs[8];
        //    rtu2mms.Frequency = strs[9];
        //    rtu2mms.DutyRatio = strs[10];
        //    rtu2mms.OpenTime = strs[11];
        //    rtu2mms.OpenAngle = strs[12];
        //    rtu2mms.NowVoltage = strs[13];
        //    rtu2mms.NowCurrent = strs[14];
        //    rtu2mms.ClientPoint = clientPoint;
        //    rtu2mms.DateTime = System.DateTime.Now.ToString();
        //    //开始保存数据库，保存到rtu2mms
        //    DAL.RTU2MMSDAL rtu2mmsdal = new DAL.RTU2MMSDAL();
        //    //查询该rtuid是否存在，存在则更新否则插入
        //    if (rtu2mmsdal.GetRTU2MMS(rtu2mms.RTUID) != null)
        //    {
        //        rtu2mmsdal.EditRTU2MMS(rtu2mms);
        //    }
        //    else
        //    {
        //        rtu2mmsdal.AddRTU2MMS(rtu2mms);
        //    }
        //    //开始保存数据库，保存到rtuWarning; 设备电流>最大电流*80%  || 设备电压>最大电压*80% || 设备电压<最小电压*120%
        //    int nowVol = Convert.ToInt32(rtu2mms.NowVoltage);
        //    int nowCur = Convert.ToInt32(rtu2mms.NowCurrent);
        //    int minVol = Convert.ToInt32(rtu2mms.MinVoltage);
        //    int maxVol = Convert.ToInt32(rtu2mms.MaxVoltage);
        //    int maxCur = Convert.ToInt32(rtu2mms.MaxCurrent);
            
        //    if ((nowCur > maxCur * 0.8) || (nowVol > maxVol * 0.8) || (nowVol < minVol * 1.2))
        //    {
        //        new DAL.RTUWarningDAL().AddRTU2MMS(rtu2mms);
        //    }
            
        //    //查询表名为rtuid是否存在，不存在则创建，否则插入
        //    DAL.RTUTablesDAL rtutablesdal = new DAL.RTUTablesDAL();
        //    rtutablesdal.AddRTUInfor(rtu2mms);
        //    //保存到mms2rtu表中，有则更新，没有则插入
        //    //ID, RTUID, Password, SwitchState, UpInterval, MaxCurrent, MinVoltage, MaxVoltage, Frequency, 
        //    //DutyRatio, OpenTime, OpenAngle, ServerPoint, StationName, DateTime, ClientPoint, ConnectState-->
        //    Model.MMS2RTU mms2rtu = new Model.MMS2RTU();
        //    mms2rtu.RTUID = strs[1];
        //    mms2rtu.Password = strs[2];
        //    //默认'K'。K-开启、G-关闭、T-停止、N-不操作      mms--rtu
        //    //N-初始、O-开启、C-关闭、S-停止、A-超时自动停止。rtu--mms
        //    if (strs[3] == "N")
        //    {
        //        mms2rtu.SwitchState = "N";
        //    }
        //    else if (strs[3] == "O")
        //    {
        //        mms2rtu.SwitchState = "K";
        //    }
        //    else if (strs[3] == "C")
        //    {
        //        mms2rtu.SwitchState = "G";
        //    }
        //    else if (strs[3] == "S")
        //    {
        //        mms2rtu.SwitchState = "T";
        //    }
        //    else
        //    {
        //        mms2rtu.SwitchState = "N";
        //    }
        //    //mms2rtu.SwitchState = strs[3];
        //    mms2rtu.UpInterval = strs[5];
        //    mms2rtu.MaxCurrent = strs[6];
        //    mms2rtu.MinVoltage = strs[7];
        //    mms2rtu.MaxVoltage = strs[8];
        //    mms2rtu.Frequency = strs[9];
        //    mms2rtu.DutyRatio = strs[10];
        //    mms2rtu.OpenTime = strs[11];
        //    mms2rtu.OpenAngle = strs[12];
        //    mms2rtu.ServerPoint = "112.253.35.82:6966";
        //    //mms2rtu.ServerPoint = ServerSocket.LocalEndPoint.ToString();
        //    //String af = ServerSocket.AddressFamily.ToString();
        //    mms2rtu.StationName = "某某区某某镇某某某村";            
        //    mms2rtu.DateTime = System.DateTime.Now.ToString();
        //    mms2rtu.ClientPoint = clientPoint;
        //    mms2rtu.ConnectState = "ON";
        //    DAL.MMS2RTUDAL mms2rtudal = new DAL.MMS2RTUDAL();
        //    if (mms2rtudal.GetMMS2RTU(mms2rtu.RTUID) != null)
        //    {
        //        //edit
        //        mms2rtudal.EditMMS2RTU(mms2rtu);
        //    }
        //    else
        //    {
        //        //insert
        //        mms2rtudal.AddMMS2RTU(mms2rtu);
        //    }


        //}
        public bool SendData(string _endPoint, byte[] _buf)
        {
            MySession myT = new MySession();
            if (dic_ClientSocket.TryGetValue(_endPoint, out myT))
            {
                myT.Send(_buf);
                return true;
            }
            else
            {
                return false;
            }
        }

    }
    public class MySession
    {
        public Socket TcpSocket;//socket对象
        public List<byte> m_Buffer = new List<byte>();//数据缓存区

        public MySession()
        {

        }

        /// <summary>
        /// 发送数据
        /// </summary>
        /// <param name="buf"></param>
        public void Send(byte[] buf)
        {
            if (buf != null)
            {
                TcpSocket.Send(buf);
            }
        }
        /// <summary>
        /// 获取连接的ip
        /// </summary>
        /// <returns></returns>
        public string GetIp()
        {
            IPEndPoint clientipe = (IPEndPoint)TcpSocket.RemoteEndPoint;
            string _ip = clientipe.Address.ToString();
            return _ip;
        }
        /// <summary>
        /// 关闭连接
        /// </summary>
        public void Close()
        {
            TcpSocket.Shutdown(SocketShutdown.Both);
        }
        /// <summary>
        /// 提取正确数据包
        /// </summary>
        public byte[] GetBuffer(int startIndex, int size)
        {
            byte[] buf = new byte[size];
            m_Buffer.CopyTo(startIndex, buf, 0, size);
            m_Buffer.RemoveRange(0, startIndex + size);
            return buf;
        }

        /// <summary>
        /// 添加队列数据
        /// </summary>
        /// <param name="buffer"></param>
        public void AddQueue(byte[] buffer)
        {
            m_Buffer.AddRange(buffer);
        }
        /// <summary>
        /// 清除缓存
        /// </summary>
        public void ClearQueue()
        {
            m_Buffer.Clear();
        }
    }

}