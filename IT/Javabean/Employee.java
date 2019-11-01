class EmployeeBean implements java.io.Serializable
{
	String name;
	int id;
	String dept;

	EmployeeBean(){}

	public String getName(){
		return name;
	}
	public int getId(){
		return id;
	}
	public String getDept(){
		return dept;
	}
	public void setName(String name){
		this.name=name;
	}
	public void setDept(String dept){
		this.dept=dept;
	}
	public void setId(int id){
		this.id=id;
	}
}
