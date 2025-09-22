const std = @import("std");
const wokwi = @import("wokwi_api.zig");

const Chip = extern struct {
    pin_in: wokwi.PinId,
    pin_out: wokwi.PinId,
};

fn on_pin_change(user_data: ?*anyopaque, _: wokwi.PinId, value: u32) void {
    const data = user_data orelse return;

    const chip: *Chip = @ptrCast(@alignCast(data));

    if (value == wokwi.HIGH) {
        wokwi.pinWrite(chip.pin_out, wokwi.LOW);
    } else {
        wokwi.pinWrite(chip.pin_out, wokwi.HIGH);
    }
}

export fn chipInit() void {
    wokwi.debugPrint("Hello Zig!\n");

    var chip = Chip{
        .pin_in = wokwi.pinInit("IN", wokwi.INPUT),
        .pin_out = wokwi.pinInit("OUT", wokwi.OUTPUT),
    };

    //var watch_config = wokwi.WatchConfig{
    //    .user_data = @ptrCast(&chip),
    //    .edge = wokwi.BOTH,
    //    .pin_change = on_pin_change,
    //};
    var watch_config = wokwi.WatchConfig{
    .user_data = @ptrCast(&chip),
    .edge = wokwi.BOTH,
    .pin_change = @ptrCast(@constCast(&on_pin_change)),
};

    _ = wokwi.pinWatch(chip.pin_in, &watch_config);
}
