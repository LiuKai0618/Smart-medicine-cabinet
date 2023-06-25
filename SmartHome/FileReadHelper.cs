using Aspose.Cells;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;

namespace SmartHome
{
    public class FileReadHelper
    {
        public void test(string path)
        {
            Workbook workbook = new Workbook(path);
            Cells cells = workbook.Worksheets[0].Cells;
            int length = cells.MaxDataRow;//117
            int ddd = cells.MaxDataColumn;//9
            string start= cells[3, 1].StringValue.Trim();
            string dfdf= cells[cells.MaxDataRow, cells.MaxDataColumn].StringValue.Trim();

            for (int i = 3; i < cells.MaxDataRow+1; i++)
            {
                Model.PersonManage pm = new Model.PersonManage();
                pm.name= cells[i, 2].StringValue.Trim();
                pm.depID = new DAL.DepManageDAL().GetDepbyDepID(cells[i, 1].StringValue.Trim()).depName;
                pm.education= cells[i, 4].StringValue.Trim();
                pm.isCertificated= cells[i, 6].StringValue.Trim();
                pm.jobPosition= cells[i, 7].StringValue.Trim();
                pm.IDCard = cells[i, 8].StringValue.Trim();
                pm.phoneNumber = cells[i, 9].StringValue.Trim();
                pm.sex = "";
                pm.registeredResidence = "";

                Model.User user = new Model.User();
                user.UserName = cells[i, 5].StringValue.Trim();
                user.UserPassword = cells[i, 3].StringValue.Trim();
                user.UserLevel = "2";

                new DAL.PersonManageDAL().AddPerson(pm);
                new DAL.UserDAL().AddUser(user);

                //string dfdfdfdf = "";
                //for (int j = 1; j < cells.MaxDataColumn+1; j++)
                //{
                //    //string temp = cells[i, j].StringValue.Trim();
                //    //Console.Write(temp);
                //}

            }


        }
        private DataTable getDTByExcel(string excelPath)
        {
            //加载Excel文件内容至DataTable
            Workbook workbook = new Workbook(excelPath);
            Cells cells = workbook.Worksheets[0].Cells;
            //dataTable
            DataTable dt = new DataTable(Path.GetFileNameWithoutExtension(excelPath));
            for (int i = 0; i < cells.MaxDataColumn + 1; i++)
            {
                dt.Columns.Add(cells[0, i].StringValue.Trim(), Type.GetType("System.Double"));

            }

            for (int i = 0; i < cells.MaxDataRow; i++)
            {
                DataRow dr = dt.NewRow();
                for (int j = 0; j < cells.MaxDataColumn + 1; j++)
                {
                    dr[cells[0, j].StringValue.Trim()] = Convert.ToDouble(cells[i + 1, j].StringValue.Trim());
                }
                dt.Rows.Add(dr);
            }
            return dt;
        }

        public static Workbook OutFileToDisk(DataTable dt, string tableName)
        {
            Workbook workbook = new Workbook(FileFormatType.Xlsx); //工作簿 
            Worksheet sheet = workbook.Worksheets[0]; //工作表 
            Cells cells = sheet.Cells;//单元格 

            //为标题设置样式     
            Style styleTitle = workbook.Styles[workbook.Styles.Add()];//新增样式 
            styleTitle.HorizontalAlignment = TextAlignmentType.Center;//文字居中 
            styleTitle.Font.Name = "宋体";//文字字体 
            styleTitle.Font.Size = 18;//文字大小 
            styleTitle.Font.IsBold = true;//粗体 

            //样式2 （第一行列标题样式设置）
            Style style2 = workbook.Styles[workbook.Styles.Add()];//新增样式 
            style2.HorizontalAlignment = TextAlignmentType.Center;//文字居中 
            style2.Font.Name = "宋体";//文字字体 
            style2.Font.Size = 14;//文字大小 
            style2.Font.IsBold = true;//粗体 
            style2.IsTextWrapped = true;//单元格内容自动换行 
            //设置上下左右线的样式
            style2.Borders[BorderType.LeftBorder].LineStyle = CellBorderType.Thin;
            style2.Borders[BorderType.RightBorder].LineStyle = CellBorderType.Thin;
            style2.Borders[BorderType.TopBorder].LineStyle = CellBorderType.Thin;
            style2.Borders[BorderType.BottomBorder].LineStyle = CellBorderType.Thin;

            //样式3 -设置数据内容的样式
            Style style3 = workbook.Styles[workbook.Styles.Add()];//新增样式 
            style3.HorizontalAlignment = TextAlignmentType.Center;//文字居中 
            style3.Font.Name = "宋体";//文字字体 
            style3.Font.Size = 12;//文字大小 
            style3.Borders[BorderType.LeftBorder].LineStyle = CellBorderType.Thin;
            style3.Borders[BorderType.RightBorder].LineStyle = CellBorderType.Thin;
            style3.Borders[BorderType.TopBorder].LineStyle = CellBorderType.Thin;
            style3.Borders[BorderType.BottomBorder].LineStyle = CellBorderType.Thin;

            int Colnum = dt.Columns.Count;//表格列数 
            int Rownum = dt.Rows.Count;//表格行数 

            //生成行1 标题行    
            cells.Merge(0, 0, 1, Colnum);//合并单元格，第一行所有列合并
            cells[0, 0].PutValue(tableName);//填写内容 
            cells[0, 0].SetStyle(styleTitle);//设置标题样式
            cells.SetRowHeight(0, 38);

            //生成行2 列名行 
            for (int i = 0; i < Colnum; i++)
            {
                cells[1, i].PutValue(dt.Columns[i].ColumnName);
                cells[1, i].SetStyle(style2);
                cells.SetRowHeight(1, 25);
            }

            //生成数据行 
            for (int i = 0; i < Rownum; i++)
            {
                for (int k = 0; k < Colnum; k++)
                {
                    cells[2 + i, k].PutValue(dt.Rows[i][k].ToString());
                    cells[2 + i, k].SetStyle(style3);
                }
                cells.SetRowHeight(2 + i, 24);
            }

            return workbook;

        }
    }
}