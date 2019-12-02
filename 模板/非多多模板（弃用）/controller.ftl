package ${config.controllerStructure};

import ${config.beanStructure}.${table.bName};
import ${config.serviceStructure}.${table.bName}Service;
import com.udutech.feiduoduo.info.util.framework.GeneralService;
import com.udutech.feiduoduo.info.util.framework.IntegerKeyGeneralController;
import com.yumaframework.support.bean.dto.CodeModeDTO;
import com.yumaframework.support.bean.query.PagingQuery;
import com.yumaframework.support.bean.vo.ListCountVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 *
 * @ClassName: ${table.bName}Controller
 * @Description: ${table.comment}实体对应控制器
 * @author ls
 * @date ${datetime}
 */
@Controller
@RequestMapping("/${table.sName}/")
public class ${table.bName}Controller extends IntegerKeyGeneralController<${table.bName}> {

    /**
     * ${table.comment}相关接口
     */
	@Resource
	private ${table.bName}Service ${table.sName}Service;

    /**
     * @Title: obtainService
     * @Description: 获取Service层接口
     * @return GeneralService<${table.keyType}, ${table.bName}> 对应泛型的Service层接口
     * @author ls
     * @date ${datetime}
     */
	@Override
	protected GeneralService<${table.keyType}, ${table.bName}> obtainService() {
		return ${table.sName}Service;
	}

    /**
     * @Title: getKey
     * @Description: 通过实体获取主键
     * @param ${table.sName} 实体
     * @return ${table.keyType} 实体对应主键
     * @author ls
     * @date ${datetime}
     */
	@Override
	protected ${table.keyType} getKey(${table.bName} ${table.sName}) {
		return ${table.sName}.get${table.bKey}();
	}

    /**
     * @Title: selectListPage
     * @Description: 分页获取列表
     * @param pagingQuery 分页参数
     * @return CodeModeDTO<ListCountVO<${table.bName}>> 查询结果
     * @author ls
     * @date ${datetime}
     */
    @ResponseBody
	@Override
    @RequestMapping(value="selectListPage", method=RequestMethod.POST)
    public CodeModeDTO<ListCountVO<${table.bName}>> selectListPage(PagingQuery<${table.bName}> pagingQuery, ${table.bName} ${table.sName}) {
        return super.selectListPage(pagingQuery, ${table.sName});
    }

    /**
     * @Title: getModel
     * @Description: 获取实体
     * @param key 主键
     * @return CodeModeDTO<${table.bName}> 查询结果
     * @author ls
     * @date ${datetime}
     */
	@ResponseBody
    @Override
    @RequestMapping(value="getModel", method=RequestMethod.POST)
    public CodeModeDTO<${table.bName}> getModel(${table.keyType} key) {
        return super.getModel(key);
    }

    /**
     * @Title: insertRecord
     * @Description: 添加记录
     * @param ${table.sName} 记录实体
     * @return CodeModeDTO 添加结果
     * @author ls
     * @date ${datetime}
     */
    @ResponseBody
    @Override
    @RequestMapping(value="insertRecord", method=RequestMethod.POST)
    public CodeModeDTO insertRecord(${table.bName} ${table.sName}) {
        return super.insertRecord(${table.sName});
    }

    /**
     * @Title: updateRecord
     * @Description: 更新记录
     * @param ${table.sName} 记录实体
     * @return CodeModeDTO 更新结果
     * @author ls
     * @date ${datetime}
     */
    @ResponseBody
    @Override
    @RequestMapping(value="updateRecord", method=RequestMethod.POST)
    public CodeModeDTO updateRecord(${table.bName} ${table.sName}) {
        return super.updateRecord(${table.sName});
    }

    /**
     * @Title: deleteRecord
     * @Description: 删除记录
     * @param key 主键
     * @return CodeModeDTO 删除结果
     * @author ls
     * @date ${datetime}
     */
    @ResponseBody
    @Override
    @RequestMapping(value="deleteRecord", method=RequestMethod.POST)
    public CodeModeDTO deleteRecord(${table.keyType} key) {
        return super.deleteRecord(key);
    }

    /**
     * @Title: deleteRecords
     * @Description: 批量删除记录
     * @param keys 主键数组
     * @return CodeModeDTO 删除结果
     * @author ls
     * @date ${datetime}
     */
    @ResponseBody
    @Override
    @RequestMapping(value="deleteRecords", method=RequestMethod.POST)
    public CodeModeDTO deleteRecords(${table.keyType}[] keys) {
        return super.deleteRecords(keys);
    }

    // 以下为管理端方法

    /**
     * @Title: selectListPageManage
     * @Description: 分页获取列表
     * @param pagingQuery 分页参数
     * @return CodeModeDTO<ListCountVO<${table.bName}>> 查询结果
     * @author ls
     * @date ${datetime}
     */
    @ResponseBody
	@Override
    @RequestMapping(value="selectListPageManage", method=RequestMethod.POST)
    public CodeModeDTO<ListCountVO<${table.bName}>> selectListPageManage(PagingQuery<${table.bName}> pagingQuery, ${table.bName} ${table.sName}) {
        return super.selectListPageManage(pagingQuery, ${table.sName});
    }

    /**
     * @Title: getModelManage
     * @Description: 获取实体
     * @param key 主键
     * @return CodeModeDTO<${table.bName}> 查询结果
     * @author ls
     * @date ${datetime}
     */
	@ResponseBody
    @Override
    @RequestMapping(value="getModelManage", method=RequestMethod.POST)
    public CodeModeDTO<${table.bName}> getModelManage(${table.keyType} key) {
        return super.getModelManage(key);
    }

    /**
     * @Title: insertRecordManage
     * @Description: 添加记录
     * @param ${table.sName} 记录实体
     * @return CodeModeDTO 添加结果
     * @author ls
     * @date ${datetime}
     */
    @ResponseBody
    @Override
    @RequestMapping(value="insertRecordManage", method=RequestMethod.POST)
    public CodeModeDTO insertRecordManage(${table.bName} ${table.sName}) {
        return super.insertRecordManage(${table.sName});
    }

    /**
     * @Title: updateRecordManage
     * @Description: 更新记录
     * @param ${table.sName} 记录实体
     * @return CodeModeDTO 更新结果
     * @author ls
     * @date ${datetime}
     */
    @ResponseBody
    @Override
    @RequestMapping(value="updateRecordManage", method=RequestMethod.POST)
    public CodeModeDTO updateRecordManage(${table.bName} ${table.sName}) {
        return super.updateRecordManage(${table.sName});
    }

    /**
     * @Title: deleteRecordManage
     * @Description: 删除记录
     * @param key 主键
     * @return CodeModeDTO 删除结果
     * @author ls
     * @date ${datetime}
     */
    @ResponseBody
    @Override
    @RequestMapping(value="deleteRecordManage", method=RequestMethod.POST)
    public CodeModeDTO deleteRecordManage(${table.keyType} key) {
        return super.deleteRecordManage(key);
    }

    /**
     * @Title: deleteRecordsManage
     * @Description: 批量删除记录
     * @param keys 主键数组
     * @return CodeModeDTO 删除结果
     * @author ls
     * @date ${datetime}
     */
    @ResponseBody
    @Override
    @RequestMapping(value="deleteRecordsManage", method=RequestMethod.POST)
    public CodeModeDTO deleteRecordsManage(${table.keyType}[] keys) {
        return super.deleteRecordsManage(keys);
    }
}