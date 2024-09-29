const std = @import("std");

// Although this function looks imperative, note that its job is to
// declaratively construct a build graph that will be executed by an external
// runner.
pub fn build(b: *std.Build) void {
    // zig fmt: off
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const ignite_axislib_version: std.SemanticVersion = .{ 
        .build = "IgniteAxis",
        .major = 1,
        .minor = 0,
        .patch = 0,
    };
    const ignite_axislib = b.addSharedLibrary(.{
        .name = "ignite-axis",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
        .version = ignite_axislib_version,
    });
    const ignite_axis = b.addModule("ignite-axis", .{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const zgl = b.dependency("zgl", .{
        .target = target,
        .optimize = optimize,
    });
    ignite_axislib.root_module.addImport("gl", zgl.module("zgl"));
    ignite_axis.addImport("gl", zgl.module("zgl"));

    const mach_glfw = b.dependency("mach-glfw", .{
        .target = target,
        .optimize = optimize,
    });
    ignite_axislib.root_module.addImport("glfw", mach_glfw.module("mach-glfw"));
    ignite_axis.addImport("glfw", mach_glfw.module("mach-glfw"));


    const zigimg = b.dependency("zigimg", .{ 
        .target = target, 
        .optimize = optimize 
    });
    ignite_axislib.root_module.addImport("zigimg", zigimg.module("zigimg"));
    ignite_axis.addImport("zigimg", zigimg.module("zigimg"));

    const zalgebra = b.dependency("zalgebra", .{ 
        .target = target,
        .optimize = optimize
    });
    ignite_axislib.root_module.addImport("zalgebra", zalgebra.module("zalgebra"));
    ignite_axis.addImport("zalgebra", zalgebra.module("zalgebra"));


    b.installArtifact(ignite_axislib);
}
