project('cgltf', 'c')


lib = library('cgltf', 'cgltf.c',
  include_directories : ['.']
)

cgltf_dep = declare_dependency(
  include_directories : ['.'],
  link_with : lib,
)

meson.override_dependency('cgltf', cgltf_dep)