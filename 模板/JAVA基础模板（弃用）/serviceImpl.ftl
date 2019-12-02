package ${config.implStructure};

import javax.annotation.Resource;

import ${config.beanStructure}.${table.bName};
import ${config.daoStructure}.${table.bName}DAO;
import ${config.serviceStructure}.${table.bName}Service;
import com.yumaframework.support.dao.GeneralDAO;
import com.yumaframework.support.service.impl.GeneralServiceImpl;
import org.springframework.stereotype.Service;

/**
 * ${table.comment}相关接口-实现类
 * @author ls
 * @since 1.0-SNAPSHOT
 */
@Service
public class ${table.bName}ServiceImpl extends GeneralServiceImpl<${table.keyType}, ${table.bName}> implements ${table.bName}Service {

	@Resource
	private ${table.bName}DAO ${table.sName}DAO;

	@Override
	protected GeneralDAO<${table.keyType}, ${table.bName}> obtainDAO() {
		return ${table.sName}DAO;
	}
}