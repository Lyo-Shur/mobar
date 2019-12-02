import common.mysql.DBHelper;
import common.mysql.generate.Builder;
import common.mysql.info.DAO;
import common.mysql.info.bean.Index;
import common.mysql.info.bean.Table;
import common.mysql.tool.NameTool;
import freemarker.template.TemplateMethodModelEx;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

        // 创建模板引擎
        String path = Main.class.getResource("").getPath();
        path = path.substring(1, path.length());
        Builder builder = new Builder(path + "template/");


        // 组装渲染参数
        HashMap<String, Object> map = new HashMap<>();
        map.put("tables", tableList);

        // 生成mdPath模板
        String mdPath = path + "out/";
        new File(mdPath).mkdirs();

        String fileName = databaseName + "数据库设计文档.md";
        File mdFile = new File(mdPath + fileName);
        builder.Execute("db.ftl", map, mdFile);
    }
}
