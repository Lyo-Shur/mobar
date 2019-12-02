package ${config.daoStructure};

import ${config.beanStructure}.${table.bName};
import com.udutech.feiduoduo.info.util.framework.GeneralDAO;

/**
 *
 * @ClassName: ${table.bName}Mapper
 * @Description: ${table.comment}相关数据接口
 * @author ls
 * @date ${datetime}
 */
public interface ${table.bName}Mapper extends GeneralDAO<${table.keyType}, ${table.bName}> {

}