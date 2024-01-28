function src_direction_entitie(x, y, x_to, y_to){
    var _angle = point_direction(x, y, x_to, y_to);
    var _direction;

    if (_angle > 45 && _angle <= 135) {
        _direction = 90; // Norte
    } else if (_angle > 135 && _angle <= 225) {
        _direction = 180; // Oeste
    } else if (_angle > 225 && _angle <= 315) {
        _direction = 270; // Sur
    } else {
        _direction = 0; // Este
    }

    return _direction;
}