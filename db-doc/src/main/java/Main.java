import common.mysql.DBHelper;
import common.mysql.generate.Builder;
import common.mysql.info.DAO;
import common.mysql.info.bean.Table;
import tool.WordExportTools;

import java.io.File;
import java.util.HashMap;
import java.util.List;

public class Main {

    public static void main(String[] args) throws Exception {
        // 变量信息
        String url = "127.0.0.1:3306";
        String username = "root";
        String password = "root";
        String databaseName = "ring";

        // 执行查询
        DBHelper dbHelper = new DBHelper(url, username, password);
        List<Table> tableList = new DAO(dbHelper).getDataBaseInfo(databaseName);
        dbHelper.close();

        // 获取路径
        String path = Main.class.getResource("").getPath();
        path = path.substring(1, path.length());

        // 生成api.ftl模板
        String docPath = path + "out/";
        new File(docPath).mkdirs();

        // 执行导出
        WordExportTools.export(docPath, tableList);
    }
}
