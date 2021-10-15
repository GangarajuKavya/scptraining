public class MyExtensionController {
    private ApexPages.StandardSetController setController;

    

    public MyExtensionController(ApexPages.StandardSetController controller) {
    
        this.setController = controller;
        
        contact [] records = [Select Name, phone from Contact Limit 5];
        
        controller.setSelected(records);
    
    

    }

}