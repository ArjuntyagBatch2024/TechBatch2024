public class InheritedSharing {
    public static void performDML() {
        Account a = [Select Id,Name from Account where Name = 'System Admin Created' LIMIT 1];
        Contact con = new Contact();
        con.AccountId = a.Id;
        con.LastName = a.Name;
        insert con;
    }

}