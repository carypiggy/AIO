package com.mpri.aio.gen.util;

/**
 * 
 * <p>
 * Title: MySqlToJavaUtil
 * </p>
 * <p>
 * Description: Mysql与JAVA 数据转换
 * </p>
 * 
 * @author syp
 * @date 2018年8月7日
 */
public class MySqlToJavaUtil {

	/**
	 * 
	 * <p>
	 * Title: getClassName
	 * </p>
	 * <p>
	 * Description:
	 * </p>
	 * 
	 * @param tableName
	 * @return ClassName
	 */
	public static String getClassNameBytableName(String tableName) {
		tableName = changeToJavaFiled(tableName);
		StringBuilder sbuilder = new StringBuilder();
		char[] c = tableName.toCharArray();
		c[0] -= 32;
		sbuilder.append(String.valueOf(c));
		return sbuilder.toString();
	}

	/**
	 * 
	 * <p>
	 * Title: changeToJavaFiled
	 * </p>
	 * <p>
	 * Description:
	 * </p>
	 * 
	 * @param field
	 * @return java字段
	 */
	public static String changeToJavaFiled(String field) {
		String[] fields = field.split("_");
		StringBuilder sbuilder = new StringBuilder(fields[0]);
		for (int i = 1; i < fields.length; i++) {
			char[] cs = fields[i].toCharArray();
			cs[0] -= 32;
			sbuilder.append(String.valueOf(cs));
		}
		return sbuilder.toString();
	}

	/**
	 * 
	 * <p>
	 * Title: jdbcTypeToJavaType
	 * </p>
	 * <p>
	 * Description:
	 * </p>
	 * 
	 * @param sqlType
	 * @return 返回的数据类型
	 */
	public static String jdbcTypeToJavaType(String sqlType) {

		if (sqlType.equalsIgnoreCase("bit")) {
			return "Boolean";
		} else if (sqlType.equalsIgnoreCase("tinyint") || sqlType.equalsIgnoreCase("smallint")
				|| sqlType.equalsIgnoreCase("int") || sqlType.equalsIgnoreCase("integer")) {
			return "Integer";
		} else if (sqlType.equalsIgnoreCase("bigint")) {
			return "Long";
		} else if (sqlType.equalsIgnoreCase("float")) {
			return "Float";
		} else if (sqlType.equalsIgnoreCase("decimal") || sqlType.equalsIgnoreCase("numeric")
				|| sqlType.equalsIgnoreCase("real") || sqlType.equalsIgnoreCase("money")
				|| sqlType.equalsIgnoreCase("smallmoney")) {
			return "Double";
		} else if (sqlType.equalsIgnoreCase("varchar") || sqlType.equalsIgnoreCase("char")
				|| sqlType.equalsIgnoreCase("nvarchar") || sqlType.equalsIgnoreCase("nchar")
				|| sqlType.equalsIgnoreCase("text")) {
			return "String";
		} else if (sqlType.equalsIgnoreCase("datetime") || sqlType.equalsIgnoreCase("date")
				|| sqlType.equalsIgnoreCase("timestamp")) {
			return "Date";
		} else if (sqlType.equalsIgnoreCase("TinyBlob") || sqlType.equalsIgnoreCase("Blob")
				|| sqlType.equalsIgnoreCase("LongBlob") || sqlType.equalsIgnoreCase("MediumBlob")) {
			return "Blob";
		}
		return null;
	}
	
	
	/**
	 * 
	 */
	public static String covertJdbcType(String sqlType) {
		if (sqlType.equalsIgnoreCase("text")) {
			return "varchar";
		}else {
			return sqlType;
		}	
	}
}
