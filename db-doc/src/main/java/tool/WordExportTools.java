package tool;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.util.Iterator;
import java.util.List;

import common.mysql.info.bean.Column;
import common.mysql.info.bean.Index;
import common.mysql.info.bean.Table;
import org.apache.poi.xwpf.usermodel.ParagraphAlignment;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblWidth;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STTblWidth;

/**
 * Word文件导出工具
 * 原代码丢失，重新整理【2019-12-02 10:53】
 */
public class WordExportTools {

    /**
     * 导出文件
     * @param path 导出路径
     * @param tableList 数据库表信息
     * @throws FileNotFoundException 文件找不到异常
     * @throws IOException IO异常
     */
    public static void export(String path, List<Table> tableList) throws FileNotFoundException, IOException {
        XWPFDocument document = getWord(tableList);
        File file = new File(path + "database.doc");
        document.write(new FileOutputStream(file));
    }

    /**
     * 根据表结构信息生成WORD
     * @param tableList 表结构信息
     * @return Word文档
     */
    private static XWPFDocument getWord(List<Table> tableList) {
        XWPFDocument document = new XWPFDocument();

        // 创建标题
        XWPFParagraph titleParagraph = document.createParagraph();
        titleParagraph.setAlignment(ParagraphAlignment.CENTER);
        XWPFRun titleParagraphRun = titleParagraph.createRun();
        titleParagraphRun.setText("数据库设计文档");
        titleParagraphRun.setColor("000000");
        titleParagraphRun.setFontSize(18);
        titleParagraphRun.setBold(true);

        // 空行
        XWPFParagraph paragraph1 = document.createParagraph();
        XWPFRun paragraphRun1 = paragraph1.createRun();
        paragraphRun1.setText("\r");

        // 循环表结构信息
        for(int i = 0; i < tableList.size(); ++i) {
            Table table = tableList.get(i);

            // 标题
            XWPFParagraph title = document.createParagraph();
            XWPFRun titleRun = title.createRun();
            titleRun.setText(i + 1 + "、" + table.getName());
            titleRun.setColor("000000");
            titleRun.setFontSize(14);
            titleRun.setBold(true);

            // 表信息描述
            XWPFParagraph subTitle = document.createParagraph();
            XWPFRun subTitleRun = subTitle.createRun();
            subTitleRun.setText("基本信息：");
            subTitleRun.setColor("000000");
            subTitleRun.setFontSize(10);
            subTitleRun.setBold(true);
            // 表信息描述
            XWPFRun subTitleRun2 = subTitle.createRun();
            subTitleRun2.setText(table.getEngine() + "、" + table.getCollation() + "、" + table.getComment());
            subTitleRun2.setColor("000000");
            subTitleRun2.setFontSize(10);

            // 空行
            XWPFParagraph change1 = document.createParagraph();
            XWPFRun changeRun1 = change1.createRun();
            changeRun1.setText("\r");

            // 表字段信息表格
            XWPFTable infoTable = document.createTable();
            infoTable.setCellMargins(30, 100, 30, 100);
            CTTblWidth infoTableWidth = infoTable.getCTTbl().addNewTblPr().addNewTblW();
            infoTableWidth.setType(STTblWidth.DXA);
            infoTableWidth.setW(BigInteger.valueOf(9072L));
            XWPFTableRow infoTableRow = infoTable.getRow(0);
            infoTableRow.getCell(0).setText("序号");
            infoTableRow.getCell(0).setColor("CCCCCC");
            infoTableRow.addNewTableCell().setText("列名");
            infoTableRow.getCell(1).setColor("CCCCCC");
            infoTableRow.addNewTableCell().setText("列类型");
            infoTableRow.getCell(2).setColor("CCCCCC");
            infoTableRow.addNewTableCell().setText("是否允许为空");
            infoTableRow.getCell(3).setColor("CCCCCC");
            infoTableRow.addNewTableCell().setText("默认值");
            infoTableRow.getCell(4).setColor("CCCCCC");
            infoTableRow.addNewTableCell().setText("注释");
            infoTableRow.getCell(5).setColor("CCCCCC");

            // 循环填充表信息
            Iterator var19 = table.getColumnList().iterator();
            while(var19.hasNext()) {
                Column column = (Column)var19.next();
                XWPFTableRow row = infoTable.createRow();
                row.getCell(0).setText(column.getNumber());
                row.getCell(1).setText(column.getName());
                row.getCell(2).setText(column.getType());
                row.getCell(3).setText(column.getNullAble());
                row.getCell(4).setText(column.getDefaule());
                row.getCell(5).setText(column.getComment());
            }

            // 空行
            XWPFParagraph change2 = document.createParagraph();
            XWPFRun changeRun2 = change2.createRun();
            changeRun2.setText("\r");

            // 索引信息
            XWPFTable indexTable = document.createTable();
            indexTable.setCellMargins(30, 100, 30, 100);
            CTTblWidth indexTableWidth = indexTable.getCTTbl().addNewTblPr().addNewTblW();
            indexTableWidth.setType(STTblWidth.DXA);
            indexTableWidth.setW(BigInteger.valueOf(9072L));
            XWPFTableRow indexTableRow = indexTable.getRow(0);
            indexTableRow.getCell(0).setText("序号");
            indexTableRow.getCell(0).setColor("CCCCCC");
            indexTableRow.addNewTableCell().setText("索引名");
            indexTableRow.getCell(1).setColor("CCCCCC");
            indexTableRow.addNewTableCell().setText("列名");
            indexTableRow.getCell(2).setColor("CCCCCC");
            indexTableRow.addNewTableCell().setText("是否是唯一约束");
            indexTableRow.getCell(3).setColor("CCCCCC");
            indexTableRow.addNewTableCell().setText("索引类型");
            indexTableRow.getCell(4).setColor("CCCCCC");

            // 循环填充索引信息
            int count = 0;
            Iterator var25 = table.getIndexList().iterator();
            while(var25.hasNext()) {
                Index index = (Index)var25.next();
                ++count;

                XWPFTableRow row = indexTable.createRow();
                row.getCell(0).setText(String.valueOf(count));
                row.getCell(1).setText(index.getName());
                row.getCell(2).setText(index.getColumnName());
                row.getCell(3).setText(index.getUnique());
                row.getCell(4).setText(index.getType());
            }
        }
        return document;
    }
}