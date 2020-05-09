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


        // 遍历表信息生成模板
        for (Table table : tableList) {
            // 组装渲染参数
            HashMap<String, Object> map = new HashMap<>();
            map.put("db", databaseName);
            map.put("table", table);
            for (Index index : table.getIndexList()) {
                if (index.getName().equals("PRIMARY")) {
                    map.put("key", index.getColumnName());
                }
            }
            map.put("type", (TemplateMethodModelEx) list -> {
                String type = list.get(0).toString().split("\\(")[0];
                Map<String, String> map1 = new HashMap<>();
                map1.put("varchar", "string");
                map1.put("int", "int64");
                map1.put("datetime", "time.Time");
                map1.put("date", "time.Time");
                map1.put("text", "string");
                map1.put("longtext", "string");
                return map1.get(type);
            });

            // 生成api.ftl模板
            String apiPath = path + "out/web/api/";
            new File(apiPath).mkdirs();
            String apiName = NameTool.underline2Camel(table.getName(), true) + ".go";
            File apiFile = new File(apiPath + apiName);
            builder.Execute("api.ftl", map, apiFile);

            // 生成controller.ftl模板
            String controllerPath = path + "out/web/controller/";
            new File(controllerPath).mkdirs();
            String controllerName = NameTool.underline2Camel(table.getName(), true) + ".go";
            File controllerFile = new File(controllerPath + controllerName);
            builder.Execute("controller.ftl", map, controllerFile);

            // 生成dao.ftl模板
            String daoPath = path + "out/dao/";
            new File(daoPath).mkdirs();
            String daoName = NameTool.underline2Camel(table.getName(), true) + ".go";
            File daoFile = new File(daoPath + daoName);
            builder.Execute("dao.ftl", map, daoFile);

            // 生成mapper.ftl模板
            String mapperPath = path + "out/mapper/";
            new File(mapperPath).mkdirs();
            String mapperName = NameTool.underline2Camel(table.getName(), true) + ".xml";
            File mapperFile = new File(mapperPath + mapperName);
            builder.Execute("mapper.ftl", map, mapperFile);

            // 生成model.ftl模板
            String modelPath = path + "out/model/";
            new File(modelPath).mkdirs();
            String modelName = NameTool.underline2Camel(table.getName(), true) + ".go";
            File modelFile = new File(modelPath + modelName);
            builder.Execute("model.ftl", map, modelFile);

            // 生成query.ftl模板
            String queryPath = path + "out/model/query/";
            new File(queryPath).mkdirs();
            String queryName = NameTool.underline2Camel(table.getName(), true) + ".go";
            File queryFile = new File(queryPath + queryName);
            builder.Execute("query.ftl", map, queryFile);

            // 生成service.ftl模板
            String servicePath = path + "out/service/";
            new File(servicePath).mkdirs();
            String serviceName = NameTool.underline2Camel(table.getName(), true) + ".go";
            File serviceFile = new File(servicePath + serviceName);
            builder.Execute("service.ftl", map, serviceFile);
        }
    }
}
