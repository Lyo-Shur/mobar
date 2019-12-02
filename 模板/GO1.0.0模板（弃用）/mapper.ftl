<xml>
    <sql>
        <key>GetList</key>
        <value>
            SELECT
                <#list table.columnList as column>${column.name}<#if column_has_next>, </#if></#list>
            FROM
                ${table.name}
            WHERE
            <#list table.columnList as column>
                {{if .${column.bName}}} ${column.name} = ${r'#'}{.${column.bName}} AND {{end}}
            </#list>
            1 = 1
            {{if ne .Start -1}} LIMIT ${r'#'}{.Start},${r'#'}{.Length} {{end}}
        </value>
    </sql>
    <sql>
        <key>GetCount</key>
        <value>
            SELECT
                COUNT(1)
            FROM
                ${table.name}
            WHERE
            <#list table.columnList as column>
                {{if .${column.bName}}} ${column.name} = ${r'#'}{.${column.bName}} AND {{end}}
            </#list>
            1 = 1
        </value>
    </sql>
    <sql>
        <key>GetModel</key>
        <value>
            SELECT
                <#list table.columnList as column>${column.name}<#if column_has_next>, </#if></#list>
            FROM
                ${table.name}
            WHERE
                ${table.key} = ${r'#'}{.}
        </value>
    </sql>
    <sql>
        <key>Update</key>
        <value>
            UPDATE ${table.name} SET
            <#list table.columnList as column>
                {{if .${column.bName}}}${column.name} = ${r'#'}{.${column.bName}},{{end}}
            </#list>
            WHERE ${table.key} = ${r'#'}{.${table.bKey}}
        </value>
    </sql>
    <sql>
        <key>Insert</key>
        <value>
            INSERT INTO ${table.name} (<#list table.columnList as column>${column.name}<#if column_has_next>, </#if></#list>)
            VALUES (<#list table.columnList as column>${r'#'}{.${column.bName}}<#if column_has_next>, </#if></#list>)
        </value>
    </sql>
    <sql>
        <key>Delete</key>
        <value>
            DELETE FROM ${table.name} WHERE ${table.key} = ${r'#'}{.}
        </value>
    </sql>
</xml>