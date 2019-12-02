<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${config.daoStructure}.${table.bName}DAO">

	<sql id="columns">
		<#list table.columnList as column><#if column_has_next>${column.name}, </#if><#if !column_has_next>${column.name}</#if></#list>
    </sql>

	<select id="getList" parameterType="${table.bName}" resultType="${table.bName}">
		SELECT <include refid="columns"/> FROM ${table.name}
		ORDER BY
			${table.key} DESC
		<if test="start != -1">
            LIMIT ${r'#'}{start },${r'#'}{length }
        </if>
	</select>

	<select id="getCount" parameterType="${table.bName}" resultType="${table.keyType}">
		SELECT count(1) FROM ${table.name}
	</select>

    <select id="searchList" parameterType="${table.bName}" resultType="${table.bName}">
        SELECT <include refid="columns"/> FROM ${table.name}
        WHERE
        <#list table.columnList as column>
        <if test="${column.sName} != null">
            ${column.name} = ${r'#'}{${column.sName} } AND
        </if>
        </#list>
        1 = 1
        ORDER BY
			${table.key} DESC
    </select>

	<select id="getModel" parameterType="${table.keyType}" resultType="${table.bName}">
		SELECT <include refid="columns"/> FROM ${table.name} WHERE ${table.key} = ${r'#'}{${table.sName} }
	</select>

	<delete id="delete" parameterType="${table.keyType}" >
        DELETE FROM ${table.name} WHERE ${table.key} = ${r'#'}{${table.sName} }
    </delete>

    <insert id="insert" parameterType="${table.bName}">
        insert into ${table.name} (<#list table.columnList as column><#if column_has_next>${column.name}, </#if><#if !column_has_next>${column.name}</#if></#list>)
        values (<#list table.columnList as column><#if column_has_next>${r'#'}{${column.sName} }, </#if><#if !column_has_next>${r'#'}{${column.sName} }</#if></#list>)
    </insert>

    <update id="update" parameterType="${table.bName}">
        update ${table.name}
        <set>
        	<#list table.columnList as column>
        	<if test="${column.sName} != null" > ${column.name} = ${r'#'}{${column.sName} },</if>
	        </#list>
        </set>
        WHERE ${table.key} = ${r'#'}{${table.sName} }
    </update>
</mapper>