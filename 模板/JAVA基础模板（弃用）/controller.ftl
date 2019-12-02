package ${config.controllerStructure};

import ${config.beanStructure}.${table.bName};
import ${config.serviceStructure}.${table.bName}Service;
import com.yumaframework.support.bean.dto.CodeModeDTO;
import com.yumaframework.support.bean.query.PagingQuery;
import com.yumaframework.support.bean.vo.ListCountVO;
import com.yumaframework.support.controller.IntegerKeyGeneralController;
import com.yumaframework.support.service.GeneralService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * ${table.comment}实体对应控制器
 * @author ls
 * @since 1.0-SNAPSHOT
 */
@Controller
@RequestMapping("/${table.sName}/")
public class ${table.bName}Controller extends ${table.keyType}KeyGeneralController<${table.bName}> {

	@Resource
	private ${table.bName}Service ${table.sName}Service;

	@Override
	protected GeneralService<${table.keyType}, ${table.bName}> obtainService() {
		return ${table.sName}Service;
	}

	@Override
	protected ${table.keyType} getKey(${table.bName} ${table.sName}) {
		return ${table.sName}.get${table.bKey}();
	}

	@ResponseBody
	@Override
    @RequestMapping(value="getList", method=RequestMethod.POST)
    public CodeModeDTO<ListCountVO<${table.bName}>> getList(PagingQuery pagingQuery) {
        return super.getList(pagingQuery);
    }

	@ResponseBody
    @Override
    @RequestMapping(value="getModel", method=RequestMethod.POST)
    public CodeModeDTO<${table.bName}> getModel(${table.keyType} key) {
        return super.getModel(key);
    }

    @ResponseBody
    @Override
    @RequestMapping(value="searchList", method=RequestMethod.POST)
    public CodeModeDTO<List<${table.bName}>> searchList(${table.bName} ${table.sName}) {
        return super.searchList(${table.sName});
    }

    @ResponseBody
    @Override
    @RequestMapping(value="insertRecord", method=RequestMethod.POST)
    public CodeModeDTO insertRecord(${table.bName} ${table.sName}) {
        return super.insertRecord(${table.sName});
    }

    @ResponseBody
    @Override
    @RequestMapping(value="updateRecord", method=RequestMethod.POST)
    public CodeModeDTO updateRecord(${table.bName} ${table.sName}) {
        return super.updateRecord(${table.sName});
    }

    @ResponseBody
    @Override
    @RequestMapping(value="deleteRecord", method=RequestMethod.POST)
    public CodeModeDTO deleteRecord(${table.keyType} key) {
        return super.deleteRecord(key);
    }

    @ResponseBody
    @Override
    @RequestMapping(value="deleteRecords", method=RequestMethod.POST)
    public CodeModeDTO deleteRecords(${table.keyType}[] keys) {
        return super.deleteRecords(keys);
    }
}