package ${config.beanStructure};

import com.yumaframework.support.bean.BasisBean;
import com.yumaframework.support.bean.dto.BooleanModeDTO;
import com.yumaframework.support.util.BasisUtils;

/**
 *
 * @ClassName: ${table.bName}
 * @Description: ${table.comment}实体
 * @author ls
 * @date ${datetime}
 */
public class ${table.bName} extends BasisBean {

<#list table.columnList as column>
	/**
	 * ${column.comment}
	 */
	private ${column.javaType} ${column.sName};
	
</#list>
<#list table.columnList as column>
	/**
	 * @Title: get${column.bName}
	 * @Description: 返回${column.comment}
	 * @return ${column.javaType} ${column.comment}
	 * @author ls
	 * @date ${datetime}
	 */
	public ${column.javaType} get${column.bName}() {
		return ${column.sName};
	}

	/**
	 * @Title: set${column.bName}
	 * @Description: 设置${column.comment}
	 * @param ${column.sName} ${column.comment}
	 * @author ls
	 * @date ${datetime}
	 */
	public void set${column.bName}(${column.javaType} ${column.sName}) {
		this.${column.sName} = ${column.sName};
	}
	
</#list>
	/**
	 * @Title: check
	 * @Description: 对实体进行检查
	 * @return BooleanModeDTO 检查结果
	 * @author ls
	 * @date ${datetime}
	 */
	@Override
	public BooleanModeDTO check(){
	<#list table.columnList as column>
		if (BasisUtils.isEmpty(${column.sName})) {
			return new BooleanModeDTO().setSuccess(false).setMessage("${column.comment}不能为空！");
		}
	</#list>
		return new BooleanModeDTO().setSuccess(true);
	}
}