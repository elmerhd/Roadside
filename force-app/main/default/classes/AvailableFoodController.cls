global without sharing class AvailableFoodController {
    
    public Table__c table;
    public List<Food_Item__c> foodItems { get; set; }
    
	public AvailableFoodController(ApexPages.StandardController controller) {
        String tableName = ApexPages.currentPage().getParameters().get('table');
        if (tableName != null) {
            table = [SELECT Id, Name FROM Table__c WHERE Name=:tableName];
        }
    }
    
    public PageReference onPageLoad(){
        foodItems = [SELECT Id, Name, Type__c, Price__c, Description__c, Image_URL__c FROM Food_Item__c WHERE Is_Available__c = True];
        return null;
    }
}