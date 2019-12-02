package ${config.beanStructure};

import com.yumaframework.support.bean.BasisBean;
import com.yumaframework.support.bean.dto.BooleanModeDTO;
import com.yumaframework.support.util.BasisUtils;

/**
 * ${table.comment}实体
 * @author ls
 * @since 1.0-SNAPSHOT
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
	 * @return 返回${column.comment}
	 */
	public ${column.javaType} get${column.bName}() {
		return ${column.sName};
	}

	/**
	 * @param ${column.sName} 设置${column.comment}
	 */
	public void set${column.bName}(${column.javaType} ${column.sName}) {
		this.${column.sName} = ${column.sName};
	}
</#list>

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