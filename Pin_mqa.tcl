#*******************************************************#**********************************************************************#**
# Code: Ayush MJ #
#Code finds duplicated pins overlapping and deletes extra pins
#Inputs: User needs to select the area and click on the Object panel on the layer/lpp for which duplicated pins are to be deleted
#********************************************************#**********************************************************************#**


set cv [ed]
set insts [de::getSelected -design $cv]
set box {}

db::foreach in $insts {

    if { [db::getAttr in.objType] == "Rectangle" } {
        if { [lindex [db::GetAttr in.LPP.lpp] 1] == "pin"} {
            set bbox [db::getAttr in.object.bBox]
            set box_str [list $box]

            #Easier to compare bbox as string using the function below 
            if { [lsearch -exact $box $box_str] >= 0 } { le::delete $in } else { lappend box $box_str}
        }
    }
}