#include cef
#include sscanf2
#include Pawn.CMD

main(){}



public OnGameModeInit()
{
  cef_subscribe("data:player", "callback");
  //where the callback is there is your public, it should consist of player_id and const arg[])
  //I will give an example below
}

forward callback(player_id, const arg[]);
public callback(player_id, const arg[])
{
    //here you need to translate read the values that came in arg
    //variables must go without fail as in the js script
    extract arg -> new string:login[50], string:pass[50];
    
    //here next you work with a login and password
}

public OnPlayerSpawn(playerid)
{
  //the playerid parameter answers to whom the browser will be created, 1 is the browser id, url, well, link to the page, false - whether the browser is hidden ( false -no, true - yes ), true - browser focus ( true - yes, false - no )
  cef_create_browser(playerid, 1, "/* url browser   */", false, true);
  
  //you can 't send an event immediately after the browser is created ( since it just won 't have time to send it )
  //therefore, it is better to do it in a team
}

cmd:test(playerid)
{
  cef_emit_event(playerid, "data:game", CEFINT(1));
  //you can send events via cef_emit_event, data:game is what the js script should have subscribed to ( it has already done this ) , 
  //CEFINT - passes the Int value to the js script, there is also CEFSTR and CEFLOAT
  //data:game may be different
}
