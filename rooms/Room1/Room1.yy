{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "Room1",
  "creationCodeFile": "",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_47F0D74C","path":"rooms/Room1/Room1.yy",},
    {"name":"inst_71C08AFB","path":"rooms/Room1/Room1.yy",},
    {"name":"inst_7AC73E10","path":"rooms/Room1/Room1.yy",},
    {"name":"inst_6BEB8C81","path":"rooms/Room1/Room1.yy",},
    {"name":"inst_461CB987","path":"rooms/Room1/Room1.yy",},
    {"name":"inst_17E8C78","path":"rooms/Room1/Room1.yy",},
    {"name":"inst_C61ABF4","path":"rooms/Room1/Room1.yy",},
    {"name":"inst_5640D0F2","path":"rooms/Room1/Room1.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Level_bounds","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_5640D0F2","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_level_frame","path":"objects/obj_level_frame/obj_level_frame.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":0.0,"y":0.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Ctrl","depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_71C08AFB","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_ctrl_inputs","path":"objects/obj_ctrl_inputs/obj_ctrl_inputs.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":0.0,"y":-32.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7AC73E10","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_ctrl_dtsteady","path":"objects/obj_ctrl_dtsteady/obj_ctrl_dtsteady.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":32.0,"y":-32.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6BEB8C81","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_ctrl_respawn","path":"objects/obj_ctrl_respawn/obj_ctrl_respawn.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":64.0,"y":-32.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_461CB987","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_ctrl_enemies","path":"objects/obj_ctrl_enemies/obj_ctrl_enemies.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":96.0,"y":-32.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_C61ABF4","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_ctrl_camera","path":"objects/obj_ctrl_camera/obj_ctrl_camera.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":128.0,"y":-32.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_47F0D74C","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_player","path":"objects/obj_player/obj_player.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":608.0,"y":480.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_17E8C78","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_respawn_point_trigger","path":"objects/obj_respawn_point_trigger/obj_respawn_point_trigger.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":672.0,"y":128.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Triggers","depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRPathLayer","resourceVersion":"1.0","name":"Path_updown","colour":4278190335,"depth":400,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"pathId":{"name":"pth_updown","path":"paths/pth_updown/pth_updown.yy",},"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_collision","depth":500,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":48,"SerialiseWidth":86,"TileCompressedData":[
-53,0,-20,-2147483648,1,1,-12,-2147483648,-53,0,-20,-2147483648,1,1,-12,-2147483648,-53,0,-20,-2147483648,1,1,-12,-2147483648,-53,0,-20,-2147483648,1,1,-12,-2147483648,-53,0,-20,-2147483648,1,1,-12,-2147483648,-53,0,-20,-2147483648,1,1,-12,-2147483648,-53,0,-20,-2147483648,1,1,-12,-2147483648,-53,0,-20,-2147483648,1,1,-12,-2147483648,-53,0,-20,-2147483648,1,1,-12,-2147483648,-53,0,-20,-2147483648,1,1,-12,-2147483648,-53,0,-20,-2147483648,1,1,
-12,-2147483648,-53,0,-20,-2147483648,1,1,-12,-2147483648,-53,0,-20,-2147483648,1,1,-12,-2147483648,-53,0,-20,-2147483648,1,1,-12,-2147483648,-53,0,-20,-2147483648,1,1,-12,-2147483648,-53,0,-20,-2147483648,1,1,-12,-2147483648,-13,1,-21,0,-11,1,-8,0,-20,-2147483648,1,1,-12,-2147483648,-13,1,-21,0,-11,1,-8,0,-20,-2147483648,1,1,-12,-2147483648,-34,0,-11,1,-8,0,-20,-2147483648,1,1,-12,-2147483648,-34,0,-40,1,
-12,-2147483648,-53,0,-33,-2147483648,-53,0,-33,-2147483648,-53,0,-33,-2147483648,-53,0,-33,-2147483648,-53,0,-33,-2147483648,-53,0,-33,-2147483648,-53,0,-33,-2147483648,-53,0,-33,-2147483648,-53,0,-93,-2147483648,1,0,-31,-2147483648,-14,1,-38,-2147483648,1,1,-4,0,-42,-2147483648,1,1,-38,-2147483648,1,1,-4,0,-11,-2147483648,-4,1,-27,-2147483648,1,1,-38,-2147483648,1,1,-4,0,-11,-2147483648,-4,1,-27,-2147483648,1,1,-38,-2147483648,1,1,
-4,0,-11,-2147483648,-4,1,-27,-2147483648,1,1,-38,-2147483648,3,1,0,0,-13,-2147483648,-4,1,-27,-2147483648,1,1,-38,-2147483648,3,1,0,0,-13,-2147483648,-4,1,-27,-2147483648,1,1,-38,-2147483648,3,1,0,0,-13,-2147483648,-4,1,-27,-2147483648,1,1,-38,-2147483648,3,1,0,0,-13,-2147483648,-4,1,-27,-2147483648,1,1,-38,-2147483648,1,1,-3,0,-12,-2147483648,-4,1,-27,-2147483648,1,1,-38,-2147483648,1,1,-3,0,
-12,-2147483648,-4,1,-27,-2147483648,1,1,-38,-2147483648,1,1,-3,0,-12,-2147483648,-4,1,-27,-2147483648,1,1,-38,-2147483648,1,1,-3,0,-12,-2147483648,-4,1,-27,-2147483648,1,1,-38,-2147483648,1,1,-3,0,-12,-2147483648,-4,1,-27,-2147483648,1,1,-38,-2147483648,3,1,0,0,-13,-2147483648,-4,1,-27,-2147483648,1,1,-38,-2147483648,3,1,0,0,-13,-2147483648,-4,1,-27,-2147483648,1,1,-38,-2147483648,3,1,0,0,-13,-2147483648,
-4,1,-27,-2147483648,1,1,-38,-2147483648,3,1,0,0,-13,-2147483648,-4,1,-27,-2147483648,1,1,-38,-2147483648,3,1,0,0,-13,-2147483648,-4,1,-8,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tileset_collision","path":"tilesets/tileset_collision/tileset_collision.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4278190080,"depth":600,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "parent": {
    "name": "Rooms",
    "path": "folders/Rooms.yy",
  },
  "parentRoom": null,
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 768,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 1366,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":1440,"hspeed":-1,"hview":720,"inherit":false,"objectId":null,"vborder":32,"visible":true,"vspeed":-1,"wport":2160,"wview":1080,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": true,
    "enableViews": true,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}