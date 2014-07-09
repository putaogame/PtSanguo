package com.engine.core.display;
class RealDisplayModel{
    private var _value:Dynamic;
    private var _users:Array<IRealDisplay>;

    public function getValue(user:IRealDisplay):Dynamic{
        if(_users == null)
            _users = new Array<IRealDisplay>();
        if(_users.indexOf(user) < 0)
            _users.push(user);
        return _value;
    }
    public function setValue(value:Dynamic):Void{
        _value = value;
        if(_users != null && _users.length > 0){
            var j:Int = 0;
            for(i in 0..._users.length){
                if(j >= _users.length){
                    break;
                }
                if(_users[j] == null ||  _users[j].disable){
                    _users.splice(j,1);
                    j--;
                }else{
                    _users[j].refresh(_value);
                }
                j++;
            }
        }
    }
}
