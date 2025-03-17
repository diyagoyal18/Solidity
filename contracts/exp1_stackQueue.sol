// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
// Diya Goyal
//102215255
contract StackQueue {
    uint[] private stack;
    function push(uint x) public {
        stack.push(x);
    }
   function pop() public returns (uint){
    require(stack.length>0 , "stack is empty");
    uint x = stack[stack.length-1];
    stack.pop();
    return x;
   }
   function top() public view returns (uint){
    require(stack.length>0,"stack is empty");
    return stack[stack.length-1];
   }
   function stackSize() public view returns(uint){
    return stack.length;
   }
     uint[] private queue;
    uint private frontIndex;

    function enqueue(uint _value) public {
        queue.push(_value);
    }

    function dequeue() public returns (uint) { 
        require(queue.length > frontIndex, "Queue is empty");
        uint value = queue[frontIndex];
        frontIndex++;
        return value;
    }

    function queueFront() public view returns (uint) {
        require(queue.length > frontIndex, "Queue is empty");
        return queue[frontIndex];
    }

    function queueSize() public view returns (uint) {
        return queue.length - frontIndex;
    }
}

    
 

//what is gas and gas limit in remix
