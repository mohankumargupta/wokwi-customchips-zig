const std = @import("std");

pub fn build(b: *std.Build) void {
    //b.prominent_compile_errors = true;
    //const mode = b.standardReleaseOptions();
    //const target = b.standardTargetOptions(.{});
    //b.release_mode = .safe;
    //const target: std.zig.CrossTarget = .{ .cpu_arch = .wasm32, .os_tag = .freestanding };

    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});


    const mod = b.addModule("chip_zig", .{
        .root_source_file = b.path("chip.zig"),
        .target = target,
        .optimize = optimize,

    });
    //mod.install();
    //lib.setTarget(target);
    //lib.setBuildMode(mode);
    //lib.addPackagePath("wokwi", "wokwi/wokwi_chip_ll.zig");
    //lib.export_table = true;
    //lib.install();
}