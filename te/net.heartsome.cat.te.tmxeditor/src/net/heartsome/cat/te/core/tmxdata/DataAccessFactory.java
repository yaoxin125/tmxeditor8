/**
 * DataAccessFactory.java
 *
 * Version information :
 *
 * Date:2013/5/17
 *
 * Copyright notice :
 * 本文件及其附带的相关文件包含机密信息，仅限瀚特盛科技有限公司指定的，与本项目有关的内部人员和客户联络人员查阅和使用。 
 * 如果您不是本保密声明中指定的收件者，请立即销毁本文件，禁止对本文件或根据本文件中的内容采取任何其他行动， 
 * 包括但不限于：泄露本文件中的信息、以任何方式制作本文件全部或部分内容之副本、将本文件或其相关副本提供给任何其他人。
 */

package net.heartsome.cat.te.core.tmxdata;

import net.heartsome.cat.te.core.utils.TeCoreUtils;

public final class DataAccessFactory {
	public static AbstractTmxDataAccess createDataAccess(TmxContainer container) {
		if (container instanceof TmxFileContainer) {
			TmxFileContainer fileContainer = (TmxFileContainer) container;
			AbstractTmxDataAccess dataAccess = new TmxFileDataAccess(fileContainer);
			return dataAccess;
		}

		if(container instanceof TmxLargeFileContainer){
			TmxLargeFileContainer fileContainer = (TmxLargeFileContainer) container;
			if(!TeCoreUtils.validateTmxContainer(fileContainer)){
				return null;
			}
			AbstractTmxDataAccess dataAccess = new TmxLargeFileDataAccess(fileContainer);
			return dataAccess;
		}
		if (container instanceof TmxDbContainer) {
			TmxDbContainer tmxDbContainer = (TmxDbContainer) container;
			AbstractTmxDataAccess dataAccess = new DatabaseDataAccess(tmxDbContainer);
			return dataAccess;
		}
		return null;
	}
}
