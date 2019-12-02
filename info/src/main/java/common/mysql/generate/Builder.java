package common.mysql.generate;

import common.mysql.tool.NameTool;
import freemarker.template.*;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

/**
 * 模板生成器
 * @author ls 2019-10-29 11:24:21
 * V1.0.5 初次编写
 */
public class Builder {
    /**
     * FreeMaker引擎的配置信息
     */
    private Configuration configuration;
    /**
     * 模板内参数
     */
    private HashMap<String, Object> attrMap = new HashMap<>();

    /**
     * 使用模板目录进行初始化构造
     */
    public Builder(String templateDir) throws IOException {
        // 创建一个Configuration对象 参数freemarker对应的版本号
        configuration = new Configuration(Configuration.getVersion());
        // 设置模板文件所在的路径
        configuration.setDirectoryForTemplateLoading(new File(templateDir));
        // 设置模板文件使用的字符集
        configuration.setDefaultEncoding("utf-8");

        // 设置默认参数
        attrMap.put("datetime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        // 默认方法
        attrMap.put("bigHump", (TemplateMethodModelEx) list -> NameTool.underline2Camel(list.get(0).toString(), false));
        attrMap.put("smallHump", (TemplateMethodModelEx) list -> NameTool.underline2Camel(list.get(0).toString(), true));
        attrMap.put("underline", (TemplateMethodModelEx) list -> NameTool.camel2Underline(list.get(0).toString()));
    }

    /**
     * 执行模板
     * @param templateName 模板名
     * @param parameter 渲染参数
     * @param outFile 输出文件
     */
    public void Execute(String templateName, HashMap<String, Object> parameter, File outFile) throws IOException, TemplateException {
        // 加载模板
        Template template = configuration.getTemplate(templateName);
        // 复制值
        for (String key : parameter.keySet()) {
            attrMap.put(key, parameter.get(key));
        }
        // 创建输出流
        if (!outFile.exists()) {
            Boolean b = outFile.createNewFile();
            if (!b) {
                throw new IOException("输出文件创建失败");
            }
        }
        Writer out = new FileWriter(outFile);
        // 输出文件
        template.process(attrMap, out);
        // 关闭流
        out.close();
    }
}
