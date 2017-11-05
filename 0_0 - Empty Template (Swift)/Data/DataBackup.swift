/************************************************************************************************************************************/
/** @file		DataBackup.swift
 *	@project    0_0 - Empty Template (Swift)
 * 	@brief		x
 * 	@details	x
 *
 * 	@author		Justin Reina, Firmware Engineer, Jaostech
 * 	@created	4/3/16
 * 	@last rev	x
 *
 *
 * 	@notes		x
 *
 * 	@section	Opens
 *          DataBackup needs tested, and should NOT be used until final confirmation of it's operation!
 *
 * 	@section	Legal Disclaimer
 * 			All contents of this source file and/or any other Jaostech related source files are the explicit property on Jaostech
 * 			Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
import UIKit


class DataBackup : NSObject, NSCoding {

    //class data
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL         = DocumentsDirectory.URLByAppendingPathComponent("Empty_Templ_Sw_Bak");

    static let verbose : Bool = false;

    //system value FOR backup
    static var vc : ViewController!;                                        /* for use and access to data during a backup store/load*/

    //data values FOR or FROM backup (temp verbose title for clarity)
    var someVal_0 : Int?;


//MARK: Initialization
    init?(someVal_0 : Int?) {                                               /* Initialization from backup                           */
        
        self.someVal_0 = someVal_0;
        
        if(DataBackup.verbose) { print("-->DataBackup.init?():                 initialization from backup begin (\(someVal_0))"); }
        
        super.init();
        
        if(DataBackup.verbose) { print("-->DataBackup.init?():                 initialization from backup complete"); }
        
        return;
    }


// MARK: NSCoding
    //store
    func encodeWithCoder(aCoder: NSCoder) {

        aCoder.encodeObject(self.someVal_0, forKey:DataBackupKeys.someVal_0);
        
        if(DataBackup.verbose) { print("-->DataBackup.encodeWithCoder():       storage complete"); }
        
        return;
    }
    
    
    //retrieve
    required convenience init?(coder aDecoder: NSCoder) {

        let someVal_0Backup : Int? = aDecoder.decodeObjectForKey(DataBackupKeys.someVal_0) as? Int;
        
        if(DataBackup.verbose) { print("-->DataBackup.convience.init?():       retrieved \(someVal_0Backup) for dummyData"); }
        
        self.init(someVal_0: someVal_0Backup);
        
        if(DataBackup.verbose) { print("-->DataBackup.convience.init?():       initialization complete"); }
        
        return;
    }


// MARK: Code Interface
    /********************************************************************************************************************************/
    /*	@fcn		class func loadData() -> DataBackup?                                                                            */
    /*  @brief      retrieve the App data & state to from file backup                                                               */
    /********************************************************************************************************************************/
    class func loadData() -> DataBackup? {

        if(DataBackup.verbose) { print("-->DataBackup.loadData():             entering NSKeyedUnarchiver search"); }

        let retrievedData : DataBackup? = NSKeyedUnarchiver.unarchiveObjectWithFile(DataBackup.ArchiveURL.path!) as? DataBackup;

        if(DataBackup.verbose) { print("-->DataBackup.loadData():             exiting NSKeyedUnarchiver search with '\(retrievedData!.hash)'"); }

        if(retrievedData != nil) {
            return retrievedData;
        }

        return nil;
    }


    /********************************************************************************************************************************/
    /*	@fcn		class func saveData()                                                                                           */
    /*  @brief      save the App data & state from the view controller access to file for later retrieval                           */
    /********************************************************************************************************************************/
    class func saveData() {

        var someData : Int = 0;
        
        let prevBak = DataBackup.loadData();
        
        if(prevBak != nil) {
        if(prevBak?.someVal_0 != nil) {
            
            print("found: \(prevBak!.someVal_0!)");
            
            someData = (prevBak!.someVal_0!) + 1;
            
            print("saved: \(someData)");

        }
        }

        
        let currState : Int = someData;

        let backup    : DataBackup    = DataBackup(someVal_0: currState)!;

        let backupSaveStatus = NSKeyedArchiver.archiveRootObject(backup,      toFile: DataBackup.ArchiveURL.path!);

        if(DataBackup.verbose) { print("-->DataBackup.saveData():    name save status is '\(backupSaveStatus)' "); }


        return;
    }
    
    
    /********************************************************************************************************************************/
    /*	@fcn		class func updateBackup()                                                                                       */
    /*  @brief      a clean wrapper for simple and clear code architecture communication                                            */
    /********************************************************************************************************************************/
    class func updateBackup() {
        DataBackup.saveData();
        return;
    }
    
    
    /********************************************************************************************************************************/
    /*	@fcn		class func storeViewController(vc : ViewController)                                                             */
    /*  @brief      x                                                                                                               */
    /********************************************************************************************************************************/
    class func storeViewController(vc : ViewController) {
        DataBackup.vc = vc;
        return;
    }
}


/************************************************************************************************************************************/
/*																  KEYS                                                              */
/************************************************************************************************************************************/
struct DataBackupKeys {
    static let someVal_0 : String = "someVal_0";
}

