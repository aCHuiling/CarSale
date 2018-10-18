package tool;




public class CreateTool {
	public static void main(String[] args) {
		ToolUtils.createClassByMySqlTable(false, "jdbc:mysql://localhost:3306/carsale", "root", "123456");
	}
}
