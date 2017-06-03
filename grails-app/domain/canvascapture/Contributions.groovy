package canvascapture

class Contributions {

	 String name;
	String email;
	String contributionType;
	String contribution ;
	String city;
	int age ;
	int picId;
    static constraints = {
		email(email:true ,blank:false,unique:false)
		picId(picId:true , blank:false , unique:true)
    }
}
