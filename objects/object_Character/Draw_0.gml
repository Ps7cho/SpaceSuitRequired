/// @description Insert description here
// You can write your code in this editor
draw_healthbar(x,y-75, x+98, y-64, (Health/unitMaxHealth)*100, c_black, c_red, c_green, 0, true, false,);
draw_self();
draw_text(x-30,y-30, string(CharacterID));
draw_text(x-30,y-75, string(objClient.MyID));
draw_text(x-30,y-60, string(Health));
