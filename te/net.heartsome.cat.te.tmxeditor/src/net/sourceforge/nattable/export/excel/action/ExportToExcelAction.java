package net.sourceforge.nattable.export.excel.action;

import net.sourceforge.nattable.NatTable;
import net.sourceforge.nattable.export.excel.command.ExportToExcelCommand;
import net.sourceforge.nattable.print.command.TurnViewportOffCommand;
import net.sourceforge.nattable.print.command.TurnViewportOnCommand;
import net.sourceforge.nattable.ui.action.IKeyAction;

import org.eclipse.swt.events.KeyEvent;

public class ExportToExcelAction implements IKeyAction {

	public void run(NatTable natTable, KeyEvent event) {
		natTable.doCommand(new TurnViewportOffCommand());

		natTable.doCommand(new ExportToExcelCommand(natTable.getConfigRegistry(), natTable.getShell()));

		natTable.doCommand(new TurnViewportOnCommand());
	}

}
