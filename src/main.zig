// This file will be included and is the core files

pub const math = @import("math.zig");
pub const app = @import("app.zig");

pub const Display = struct {
    pub const Window = @import("Display/Window.zig");
    pub const Vertices = @import("Display/Vertices.zig"); 
    pub const Object = @import("Display/Object.zig");
    pub const Renderer = @import("Display/Renderer.zig");
};

pub const Camera = @import("Display/Camera.zig");
pub const Texture = @import("Display/Texture.zig");

pub const Game = @import("Game/Game.zig");
pub const GameObject = @import("Game/GameObject.zig");

pub const Scene = @import("Game/Scene.zig");
pub const input = @import("Game/input.zig");

pub usingnamespace app;

pub const glfwErrorString = @import("glfw").getErrorString;