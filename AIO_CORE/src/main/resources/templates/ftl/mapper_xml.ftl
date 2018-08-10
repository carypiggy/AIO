<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${daoUrl}.${genTableInfo.entityName}Mapper">

  	<!-- 基础返回值定义 -->
	<resultMap id="BaseResultMap" type="${entityUrl}.${genTableInfo.entityName}">
		<#list genTableInfo.columuInfos as ci>
			<#if ci.objProperty == "id" || ci.objProperty =="ID">
			<id column="${ci.columnName}" jdbcType="${ci.columnType?upper_case}" property="${ci.objProperty}" />
			<#else>
			<result column="${ci.columnName}" jdbcType="${ci.columnType?upper_case}" property="${ci.objProperty}" />
			</#if>				
		</#list>
	</resultMap>
	
    <!-- 基础字段定义 -->
	<sql id="Base_Column_List">
    	${genTableInfo.agile}
	</sql>

	<!-- 查询条件定义 -->
	<sql id="query_where">
		<if test="entity!=null">
			<#list genTableInfo.columuInfos as ci>
			<#if ci.objProperty == "name">
	       	<if test="entity.name!=null and entity.name!='' ">
	           	and name LIKE ${r'%#{entity.name}%'}
	       	</if>		
			<#elseif ci.objProperty == "flag">
			<if test="entity.flag != null and entity.flag!='' ">
        		and flag= ${r'#{entity.FLAG_NORMAL}'}
      		</if>
	      	<#else>
			<if test="entity.${ci.objProperty} != null and entity.${ci.objProperty}!='' ">
        		and ${ci.columnName}=${r'#{entity.'}${ci.objProperty}}
      		</if>	      	
			</#if>      		
      		</#list>
		</if>
	</sql>
	
  	<!-- 根据id查询 -->
  	<select id="get" parameterType="${entityUrl}.${genTableInfo.entityName}" resultMap="BaseResultMap">
   	    select 
    		<include refid="Base_Column_List" />
    	from ${genTableInfo.table}
    	where id = ${r'#{id,jdbcType=VARCHAR}'} and flag = ${r'#{FLAG_NORMAL}'}
  	</select>
 
 	<!-- 分页查询 -->
    <select id="loadByPage" parameterType="${entityUrl}.${genTableInfo.entityName}" resultMap="BaseResultMap" >
    	select
    		<include refid="Base_Column_List" />
    	from ${genTableInfo.table} 
    	<where>
	  		<include refid="query_where"></include>
    	</where>
  	</select>

  	<!-- 依照条件查询所有对象 -->
  	<select id="loadAllListBy"  parameterType="${entityUrl}.${genTableInfo.entityName}" resultMap="BaseResultMap" >
    	select
    		<include refid="Base_Column_List" />
    	from ${genTableInfo.table} 
		<where>
	  		<include refid="query_where"></include>
    	</where>
  	</select>

	<!-- 删除对象 -->
  	<update id="delete" parameterType="${entityUrl}.${genTableInfo.entityName}">
    	update ${genTableInfo.table} set flag = ${r'#{FLAG_DELETE}'} where id = ${r'#{id,jdbcType=VARCHAR}'}
  	</update>
  	
  	<!-- 插入数据 -->
  	<insert id="insert" parameterType="com.mpri.aio.system.model.SysDict">
		insert into ${genTableInfo.table}
		<trim prefix="(" suffix=")" suffixOverrides=",">
			<#list genTableInfo.columuInfos as ci>
	   		<if test="${ci.objProperty} != null">
	    		${ci.columnName},
	  		</if>   			
			</#list>
		</trim>
		<trim prefix="values (" suffix=")" suffixOverrides=",">
			<#list genTableInfo.columuInfos as ci>
	   		<if test="${ci.objProperty} != null">
	   			${r'#{'}${ci.objProperty},jdbcType=${ci.columnType?upper_case}},
	  		</if>   			
			</#list>    	
		</trim>
  	</insert>

  	<!-- 更新数据 -->
  	<update id="update" parameterType="${entityUrl}.${genTableInfo.entityName}">
    	update ${genTableInfo.table}
    	<set>
			<#list genTableInfo.columuInfos as ci>
			<#if ci.objProperty == "id">
			<#else>
			<if test="${ci.objProperty} != null">
	   			${ci.columnName} = ${r'#{'}${ci.objProperty},jdbcType=${ci.columnType?upper_case}},
	  		</if>  
			</#if>		
			</#list>        	
    	</set>
    	where id = ${r'#{id,jdbcType=VARCHAR}'}
	</update>

</mapper>