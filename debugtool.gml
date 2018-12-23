draw_set_colour(c_white);

draw_text(16,16,"Obj_ship.velocity = ");
draw_text(192,16,string(obj_ship.velocity));

draw_text(16,32,"Obj_ship.speed = ");
draw_text(192,32,string(obj_ship.speed));

draw_text(16,48,"Obj_ship.x = ");
draw_text(192,48,string(obj_ship.x));

draw_text(16,64,"Obj_ship.y = ");
draw_text(192,64,string(obj_ship.y));

draw_text(16,80,"obj_camera.x = ");
draw_text(192,80,string(obj_camera.x));

draw_text(16,96,"obj_camera.y = ");
draw_text(192,96,string(obj_camera.y));

draw_text(16,112,"camera_get_view_width(cam) = ");
draw_text(300,112,string(camera_get_view_width(obj_camera.cam)));
