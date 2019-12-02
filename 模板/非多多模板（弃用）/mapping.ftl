<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${config.daoStructure}.${table.bName}Mapper">

	<sql id="columns">
		<#list table.columnList as column><#if column_has_next>${column.name}, </#if><#if !column_has_next>${column.name}</#if></#list>
    </sql>

	<select id="selectListPage" parameterType="PagingQuery" resultType="${table.bName}">
		SELECT <include refid="columns"/> FROM ${table.name}
		WHERE
        <#list table.columnList as column>
        <if test="data.${column.sName} != null">
            ${column.name} = ${r'#'}{data.${column.sName} } AND
        </if>
        </#list>
        1 = 1
		ORDER BY
			${table.key} DESC
		<if test="start != -1">
            LIMIT ${r'#'}{start },${r'#'}{length }
        </if>
	</select>

	<select id="selectCount" parameterType="${table.bName}" resultType="Integer">
		SELECT count(1) FROM ${table.name}
		WHERE
        <#list table.columnList as column>
        <if test="${column.sName} != null">
            ${column.name} = ${r'#'}{${column.sName} } AND
        </if>
        </#list>
        1 = 1
	</select>

	<select id="getModel" parameterType="${table.keyType}" resultType="${table.bName}">
		SELECT <include refid="columns"/> FROM ${table.name} WHERE ${table.key} = ${r'#'}{${table.sName} }
	</select>

	<delete id="deleteRecord" parameterType="${table.keyType}" >
        DELETE FROM ${table.name} WHERE ${table.key} = ${r'#'}{${table.sName} }
    </delete>

    <insert id="insertRecord" parameterType="${table.bName}">
        insert into ${table.name} (<#list table.columnList as column><#if column_has_next>${column.name}, </#if><#if !column_has_next>${column.name}</#if></#list>)
        values (<#list table.columnList as column><#if column_has_next>${r'#'}{${column.sName} }, </#if><#if !column_has_next>${r'#'}{${column.sName} }</#if></#list>)
    </insert>

    <update id="updateRecord" parameterType="${table.bName}">
        update ${table.name}
        <set>
        	<#list table.columnList as column>
        	<if test="${column.sName} != null" > ${column.name} = ${r'#'}{${column.sName} },</if>
	        </#list>
        </set>
        WHERE ${table.key} = ${r'#'}{${table.sName} }
    </update>
    
    <!-- Manage -->
    
    <select id="selectListPageManage" parameterType="PagingQuery" resultType="${table.bName}">
		SELECT <include refid="columns"/> FROM ${table.name}
		WHERE
        <#list table.columnList as column>
        <if test="data.${column.sName} != null">
            ${column.name} = ${r'#'}{data.${column.sName} } AND
        </if>
        </#list>
        1 = 1
		ORDER BY
			${table.key} DESC
		<if test="start != -1">
            LIMIT ${r'#'}{start },${r'#'}{length }
        </if>
	</select>

	<select id="selectCountManage" parameterType="${table.bName}" resultType="Integer">
		SELECT count(1) FROM ${table.name}
		WHERE
        <#list table.columnList as column>
        <if test="${column.sName} != null">
            ${column.name} = ${r'#'}{${column.sName} } AND
        </if>
        </#list>
        1 = 1
	</select>

	<select id="getModelManage" parameterType="${table.keyType}" resultType="${table.bName}">
		SELECT <include refid="columns"/> FROM ${table.name} WHERE ${table.key} = ${r'#'}{${table.sName} }
	</select>

	<delete id="deleteRecordManage" parameterType="${table.keyType}" >
        DELETE FROM ${table.name} WHERE ${table.key} = ${r'#'}{${table.sName} }
    </delete>

    <insert id="insertRecordManage" parameterType="${table.bName}">
        insert into ${table.name} (<#list table.columnList as column><#if column_has_next>${column.name}, </#if><#if !column_has_next>${column.name}</#if></#list>)
        values (<#list table.columnList as column><#if column_has_next>${r'#'}{${column.sName} }, </#if><#if !column_has_next>${r'#'}{${column.sName} }</#if></#list>)
    </insert>

    <update id="updateRecordManage" parameterType="${table.bName}">
        update ${table.name}
        <set>
        	<#list table.columnList as column>
        	<if test="${column.sName} != null" > ${column.name} = ${r'#'}{${column.sName} },</if>
	        </#list>
        </set>
        WHERE ${table.key} = ${r'#'}{${table.sName} }
    </update>
</mapper>