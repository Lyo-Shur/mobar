package ${config.implStructure};

import javax.annotation.Resource;

import ${config.beanStructure}.${table.bName};
import ${config.daoStructure}.${table.bName}Mapper;
import ${config.serviceStructure}.${table.bName}Service;
import com.udutech.feiduoduo.info.util.framework.GeneralDAO;
import com.udutech.feiduoduo.info.util.framework.GeneralServiceImpl;
import org.springframework.stereotype.Service;

/**
 *
 * @ClassName: ${table.bName}ServiceImpl
 * @Description: ${table.comment}相关接口-实现类
 * @author ls
 * @date ${datetime}
 */
@Service
public class ${table.bName}ServiceImpl extends GeneralServiceImpl<${table.keyType}, ${table.bName}> implements ${table.bName}Service {

	/**
	 * ${table.comment}相关数据接口
	 */
	@Resource
	private ${table.bName}Mapper ${table.sName}Mapper;

	/**
	 * @Title: obtainDAO
	 * @Description: 获取DAO层接口
	 * @return GeneralDAO<${table.keyType}, ${table.bName}> 对应泛型的DAO层接口
	 * @author ls
	 * @date ${datetime}
	 */
	@Override
	protected GeneralDAO<${table.keyType}, ${table.bName}> obtainDAO() {
		return ${table.sName}Mapper;
	}
}