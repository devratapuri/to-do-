pragma solidity ^0.5.17 ;
pragma experimental ABIEncoderV2;
contract todo{
    address owner = msg.sender;

    struct Tasks{
     string task;
     bool taskdone;
    }
    mapping (address => Tasks[]) private user;
    
    function addTask(string calldata _task) external {
        user[owner].push(Tasks({                                     
        task:_task,                                               
        taskdone:false                                              
        }));                                                      
}  
  function getTask(uint _taskindex) external view returns (Tasks memory ){
      Tasks memory task = user[msg.sender][_taskindex];
      return task;
  }
    function updateStatus(uint256 _taskIndex,bool _status) external 
{ 
user[msg.sender][_taskIndex].taskdone = _status; 
} 
  function deleteTask(uint256 _taskIndex) external 
{ 
delete user[msg.sender][_taskIndex]; 
} 
   function getTaskCount() external view returns (uint256) 
{ 
return user[msg.sender].length; 
}

    }


