module cgltf;

extern(C):

alias cgltf_size = size_t;
alias cgltf_ssize = long;
alias cgltf_float = float;
alias cgltf_int = int;
alias cgltf_uint = uint;
alias cgltf_bool = int;

enum cgltf_file_type
{
 cgltf_file_type_invalid,
 cgltf_file_type_gltf,
 cgltf_file_type_glb,
 cgltf_file_type_max_enum
}

enum cgltf_result
{
 cgltf_result_success,
 cgltf_result_data_too_short,
 cgltf_result_unknown_format,
 cgltf_result_invalid_json,
 cgltf_result_invalid_gltf,
 cgltf_result_invalid_options,
 cgltf_result_file_not_found,
 cgltf_result_io_error,
 cgltf_result_out_of_memory,
 cgltf_result_legacy_gltf,
    cgltf_result_max_enum
}

struct cgltf_memory_options
{
 void* function(void* user, cgltf_size size) alloc_func;
 void function(void* user, void* ptr) free_func;
 void* user_data;
}

struct cgltf_file_options
{
 cgltf_result function(const cgltf_memory_options* memory_options, const cgltf_file_options* file_options, const char* path, cgltf_size* size, void** data) read;
 void function(const cgltf_memory_options* memory_options, const cgltf_file_options* file_options, void* data) release;
 void* user_data;
}

struct cgltf_options
{
 cgltf_file_type type;
 cgltf_size json_token_count;
 cgltf_memory_options memory;
 cgltf_file_options file;
}

enum cgltf_buffer_view_type
{
 cgltf_buffer_view_type_invalid,
 cgltf_buffer_view_type_indices,
 cgltf_buffer_view_type_vertices,
 cgltf_buffer_view_type_max_enum
}

enum cgltf_attribute_type
{
 cgltf_attribute_type_invalid,
 cgltf_attribute_type_position,
 cgltf_attribute_type_normal,
 cgltf_attribute_type_tangent,
 cgltf_attribute_type_texcoord,
 cgltf_attribute_type_color,
 cgltf_attribute_type_joints,
 cgltf_attribute_type_weights,
 cgltf_attribute_type_custom,
 cgltf_attribute_type_max_enum
}

enum cgltf_component_type
{
 cgltf_component_type_invalid,
 cgltf_component_type_r_8,
 cgltf_component_type_r_8u,
 cgltf_component_type_r_16,
 cgltf_component_type_r_16u,
 cgltf_component_type_r_32u,
 cgltf_component_type_r_32f,
    cgltf_component_type_max_enum
}

enum cgltf_type
{
 cgltf_type_invalid,
 cgltf_type_scalar,
 cgltf_type_vec2,
 cgltf_type_vec3,
 cgltf_type_vec4,
 cgltf_type_mat2,
 cgltf_type_mat3,
 cgltf_type_mat4,
 cgltf_type_max_enum
}

enum cgltf_primitive_type
{
 cgltf_primitive_type_points,
 cgltf_primitive_type_lines,
 cgltf_primitive_type_line_loop,
 cgltf_primitive_type_line_strip,
 cgltf_primitive_type_triangles,
 cgltf_primitive_type_triangle_strip,
 cgltf_primitive_type_triangle_fan,
 cgltf_primitive_type_max_enum
}

enum cgltf_alpha_mode
{
 cgltf_alpha_mode_opaque,
 cgltf_alpha_mode_mask,
 cgltf_alpha_mode_blend,
 cgltf_alpha_mode_max_enum
}

enum cgltf_animation_path_type {
 cgltf_animation_path_type_invalid,
 cgltf_animation_path_type_translation,
 cgltf_animation_path_type_rotation,
 cgltf_animation_path_type_scale,
 cgltf_animation_path_type_weights,
 cgltf_animation_path_type_max_enum
}

enum cgltf_interpolation_type {
 cgltf_interpolation_type_linear,
 cgltf_interpolation_type_step,
 cgltf_interpolation_type_cubic_spline,
 cgltf_interpolation_type_max_enum
}

enum cgltf_camera_type {
 cgltf_camera_type_invalid,
 cgltf_camera_type_perspective,
 cgltf_camera_type_orthographic,
 cgltf_camera_type_max_enum
}

enum cgltf_light_type {
 cgltf_light_type_invalid,
 cgltf_light_type_directional,
 cgltf_light_type_point,
 cgltf_light_type_spot,
 cgltf_light_type_max_enum
}

enum cgltf_data_free_method {
 cgltf_data_free_method_none,
 cgltf_data_free_method_file_release,
 cgltf_data_free_method_memory_free,
 cgltf_data_free_method_max_enum
}

struct cgltf_extras {
 cgltf_size start_offset;
 cgltf_size end_offset;
}

struct cgltf_extension {
 char* name;
 char* data;
}

struct cgltf_buffer
{
 char* name;
 cgltf_size size;
 char* uri;
 void* data;
 cgltf_data_free_method data_free_method;
 cgltf_extras extras;
 cgltf_size extensions_count;
 cgltf_extension* extensions;
}

enum cgltf_meshopt_compression_mode {
 cgltf_meshopt_compression_mode_invalid,
 cgltf_meshopt_compression_mode_attributes,
 cgltf_meshopt_compression_mode_triangles,
 cgltf_meshopt_compression_mode_indices,
 cgltf_meshopt_compression_mode_max_enum
}

enum cgltf_meshopt_compression_filter {
 cgltf_meshopt_compression_filter_none,
 cgltf_meshopt_compression_filter_octahedral,
 cgltf_meshopt_compression_filter_quaternion,
 cgltf_meshopt_compression_filter_exponential,
 cgltf_meshopt_compression_filter_max_enum
}

struct cgltf_meshopt_compression
{
 cgltf_buffer* buffer;
 cgltf_size offset;
 cgltf_size size;
 cgltf_size stride;
 cgltf_size count;
 cgltf_meshopt_compression_mode mode;
 cgltf_meshopt_compression_filter filter;
}

struct cgltf_buffer_view
{
 char *name;
 cgltf_buffer* buffer;
 cgltf_size offset;
 cgltf_size size;
 cgltf_size stride;
 cgltf_buffer_view_type type;
 void* data;
 cgltf_bool has_meshopt_compression;
 cgltf_meshopt_compression meshopt_compression;
 cgltf_extras extras;
 cgltf_size extensions_count;
 cgltf_extension* extensions;
}

struct cgltf_accessor_sparse
{
 cgltf_size count;
 cgltf_buffer_view* indices_buffer_view;
 cgltf_size indices_byte_offset;
 cgltf_component_type indices_component_type;
 cgltf_buffer_view* values_buffer_view;
 cgltf_size values_byte_offset;
 cgltf_extras extras;
 cgltf_extras indices_extras;
 cgltf_extras values_extras;
 cgltf_size extensions_count;
 cgltf_extension* extensions;
 cgltf_size indices_extensions_count;
 cgltf_extension* indices_extensions;
 cgltf_size values_extensions_count;
 cgltf_extension* values_extensions;
}

struct cgltf_accessor
{
 char* name;
 cgltf_component_type component_type;
 cgltf_bool normalized;
 cgltf_type type;
 cgltf_size offset;
 cgltf_size count;
 cgltf_size stride;
 cgltf_buffer_view* buffer_view;
 cgltf_bool has_min;
 cgltf_float[16] min;
 cgltf_bool has_max;
 cgltf_float[16] max;
 cgltf_bool is_sparse;
 cgltf_accessor_sparse sparse;
 cgltf_extras extras;
 cgltf_size extensions_count;
 cgltf_extension* extensions;
}

struct cgltf_attribute
{
 char* name;
 cgltf_attribute_type type;
 cgltf_int index;
 cgltf_accessor* data;
}

struct cgltf_image
{
 char* name;
 char* uri;
 cgltf_buffer_view* buffer_view;
 char* mime_type;
 cgltf_extras extras;
 cgltf_size extensions_count;
 cgltf_extension* extensions;
}

struct cgltf_sampler
{
 char* name;
 cgltf_int mag_filter;
 cgltf_int min_filter;
 cgltf_int wrap_s;
 cgltf_int wrap_t;
 cgltf_extras extras;
 cgltf_size extensions_count;
 cgltf_extension* extensions;
}

struct cgltf_texture
{
 char* name;
 cgltf_image* image;
 cgltf_sampler* sampler;
 cgltf_bool has_basisu;
 cgltf_image* basisu_image;
 cgltf_extras extras;
 cgltf_size extensions_count;
 cgltf_extension* extensions;
}

struct cgltf_texture_transform
{
 cgltf_float[2] offset;
 cgltf_float rotation;
 cgltf_float[2] scale;
 cgltf_bool has_texcoord;
 cgltf_int texcoord;
}

struct cgltf_texture_view
{
 cgltf_texture* texture;
 cgltf_int texcoord;
 cgltf_float scale;
 cgltf_bool has_transform;
 cgltf_texture_transform transform;
 cgltf_extras extras;
 cgltf_size extensions_count;
 cgltf_extension* extensions;
}

struct cgltf_pbr_metallic_roughness
{
 cgltf_texture_view base_color_texture;
 cgltf_texture_view metallic_roughness_texture;

 cgltf_float[4] base_color_factor;
 cgltf_float metallic_factor;
 cgltf_float roughness_factor;

 cgltf_extras extras;
}

struct cgltf_pbr_specular_glossiness
{
 cgltf_texture_view diffuse_texture;
 cgltf_texture_view specular_glossiness_texture;

 cgltf_float[4] diffuse_factor;
 cgltf_float[3] specular_factor;
 cgltf_float glossiness_factor;
}

struct cgltf_clearcoat
{
 cgltf_texture_view clearcoat_texture;
 cgltf_texture_view clearcoat_roughness_texture;
 cgltf_texture_view clearcoat_normal_texture;

 cgltf_float clearcoat_factor;
 cgltf_float clearcoat_roughness_factor;
}

struct cgltf_transmission
{
 cgltf_texture_view transmission_texture;
 cgltf_float transmission_factor;
}

struct cgltf_ior
{
 cgltf_float ior;
}

struct cgltf_specular
{
 cgltf_texture_view specular_texture;
 cgltf_texture_view specular_color_texture;
 cgltf_float[3] specular_color_factor;
 cgltf_float specular_factor;
}

struct cgltf_volume
{
 cgltf_texture_view thickness_texture;
 cgltf_float thickness_factor;
 cgltf_float[3] attenuation_color;
 cgltf_float attenuation_distance;
}

struct cgltf_sheen
{
 cgltf_texture_view sheen_color_texture;
 cgltf_float[3] sheen_color_factor;
 cgltf_texture_view sheen_roughness_texture;
 cgltf_float sheen_roughness_factor;
}

struct cgltf_emissive_strength
{
 cgltf_float emissive_strength;
}

struct cgltf_iridescence
{
 cgltf_float iridescence_factor;
 cgltf_texture_view iridescence_texture;
 cgltf_float iridescence_ior;
 cgltf_float iridescence_thickness_min;
 cgltf_float iridescence_thickness_max;
 cgltf_texture_view iridescence_thickness_texture;
}

struct cgltf_material
{
 char* name;
 cgltf_bool has_pbr_metallic_roughness;
 cgltf_bool has_pbr_specular_glossiness;
 cgltf_bool has_clearcoat;
 cgltf_bool has_transmission;
 cgltf_bool has_volume;
 cgltf_bool has_ior;
 cgltf_bool has_specular;
 cgltf_bool has_sheen;
 cgltf_bool has_emissive_strength;
 cgltf_bool has_iridescence;
 cgltf_pbr_metallic_roughness pbr_metallic_roughness;
 cgltf_pbr_specular_glossiness pbr_specular_glossiness;
 cgltf_clearcoat clearcoat;
 cgltf_ior ior;
 cgltf_specular specular;
 cgltf_sheen sheen;
 cgltf_transmission transmission;
 cgltf_volume volume;
 cgltf_emissive_strength emissive_strength;
 cgltf_iridescence iridescence;
 cgltf_texture_view normal_texture;
 cgltf_texture_view occlusion_texture;
 cgltf_texture_view emissive_texture;
 cgltf_float[3] emissive_factor;
 cgltf_alpha_mode alpha_mode;
 cgltf_float alpha_cutoff;
 cgltf_bool double_sided;
 cgltf_bool unlit;
 cgltf_extras extras;
 cgltf_size extensions_count;
 cgltf_extension* extensions;
}

struct cgltf_material_mapping
{
 cgltf_size variant;
 cgltf_material* material;
 cgltf_extras extras;
}

struct cgltf_morph_target {
 cgltf_attribute* attributes;
 cgltf_size attributes_count;
}

struct cgltf_draco_mesh_compression {
 cgltf_buffer_view* buffer_view;
 cgltf_attribute* attributes;
 cgltf_size attributes_count;
}

struct cgltf_mesh_gpu_instancing {
 cgltf_buffer_view* buffer_view;
 cgltf_attribute* attributes;
 cgltf_size attributes_count;
}

struct cgltf_primitive {
 cgltf_primitive_type type;
 cgltf_accessor* indices;
 cgltf_material* material;
 cgltf_attribute* attributes;
 cgltf_size attributes_count;
 cgltf_morph_target* targets;
 cgltf_size targets_count;
 cgltf_extras extras;
 cgltf_bool has_draco_mesh_compression;
 cgltf_draco_mesh_compression draco_mesh_compression;
 cgltf_material_mapping* mappings;
 cgltf_size mappings_count;
 cgltf_size extensions_count;
 cgltf_extension* extensions;
}

struct cgltf_mesh {
 char* name;
 cgltf_primitive* primitives;
 cgltf_size primitives_count;
 cgltf_float* weights;
 cgltf_size weights_count;
 char** target_names;
 cgltf_size target_names_count;
 cgltf_extras extras;
 cgltf_size extensions_count;
 cgltf_extension* extensions;
}

// struct cgltf_node cgltf_node;

struct cgltf_skin {
 char* name;
 cgltf_node** joints;
 cgltf_size joints_count;
 cgltf_node* skeleton;
 cgltf_accessor* inverse_bind_matrices;
 cgltf_extras extras;
 cgltf_size extensions_count;
 cgltf_extension* extensions;
}

struct cgltf_camera_perspective {
 cgltf_bool has_aspect_ratio;
 cgltf_float aspect_ratio;
 cgltf_float yfov;
 cgltf_bool has_zfar;
 cgltf_float zfar;
 cgltf_float znear;
 cgltf_extras extras;
}

struct cgltf_camera_orthographic {
 cgltf_float xmag;
 cgltf_float ymag;
 cgltf_float zfar;
 cgltf_float znear;
 cgltf_extras extras;
}

struct cgltf_camera {
 char* name;
 cgltf_camera_type type;
 union data{
  cgltf_camera_perspective perspective;
  cgltf_camera_orthographic orthographic;
 }
 cgltf_extras extras;
 cgltf_size extensions_count;
 cgltf_extension* extensions;
}

struct cgltf_light {
 char* name;
 cgltf_float[3] color;
 cgltf_float intensity;
 cgltf_light_type type;
 cgltf_float range;
 cgltf_float spot_inner_cone_angle;
 cgltf_float spot_outer_cone_angle;
 cgltf_extras extras;
}

struct cgltf_node {
 char* name;
 cgltf_node* parent;
 cgltf_node** children;
 cgltf_size children_count;
 cgltf_skin* skin;
 cgltf_mesh* mesh;
 cgltf_camera* camera;
 cgltf_light* light;
 cgltf_float* weights;
 cgltf_size weights_count;
 cgltf_bool has_translation;
 cgltf_bool has_rotation;
 cgltf_bool has_scale;
 cgltf_bool has_matrix;
 cgltf_float[3] translation;
 cgltf_float[4] rotation;
 cgltf_float[3] scale;
 cgltf_float[16] matrix;
 cgltf_extras extras;
 cgltf_bool has_mesh_gpu_instancing;
 cgltf_mesh_gpu_instancing mesh_gpu_instancing;
 cgltf_size extensions_count;
 cgltf_extension* extensions;
};

struct cgltf_scene {
 char* name;
 cgltf_node** nodes;
 cgltf_size nodes_count;
 cgltf_extras extras;
 cgltf_size extensions_count;
 cgltf_extension* extensions;
}

struct cgltf_animation_sampler {
 cgltf_accessor* input;
 cgltf_accessor* output;
 cgltf_interpolation_type interpolation;
 cgltf_extras extras;
 cgltf_size extensions_count;
 cgltf_extension* extensions;
}

struct cgltf_animation_channel {
 cgltf_animation_sampler* sampler;
 cgltf_node* target_node;
 cgltf_animation_path_type target_path;
 cgltf_extras extras;
 cgltf_size extensions_count;
 cgltf_extension* extensions;
}

struct cgltf_animation {
 char* name;
 cgltf_animation_sampler* samplers;
 cgltf_size samplers_count;
 cgltf_animation_channel* channels;
 cgltf_size channels_count;
 cgltf_extras extras;
 cgltf_size extensions_count;
 cgltf_extension* extensions;
}

struct cgltf_material_variant
{
 char* name;
 cgltf_extras extras;
}

struct cgltf_asset {
 char* copyright;
 char* generator;
 char* version_;
 char* min_version;
 cgltf_extras extras;
 cgltf_size extensions_count;
 cgltf_extension* extensions;
}

struct cgltf_data
{
 cgltf_file_type file_type;
 void* file_data;

 cgltf_asset asset;

 cgltf_mesh* meshes;
 cgltf_size meshes_count;

 cgltf_material* materials;
 cgltf_size materials_count;

 cgltf_accessor* accessors;
 cgltf_size accessors_count;

 cgltf_buffer_view* buffer_views;
 cgltf_size buffer_views_count;

 cgltf_buffer* buffers;
 cgltf_size buffers_count;

 cgltf_image* images;
 cgltf_size images_count;

 cgltf_texture* textures;
 cgltf_size textures_count;

 cgltf_sampler* samplers;
 cgltf_size samplers_count;

 cgltf_skin* skins;
 cgltf_size skins_count;

 cgltf_camera* cameras;
 cgltf_size cameras_count;

 cgltf_light* lights;
 cgltf_size lights_count;

 cgltf_node* nodes;
 cgltf_size nodes_count;

 cgltf_scene* scenes;
 cgltf_size scenes_count;

 cgltf_scene* scene;

 cgltf_animation* animations;
 cgltf_size animations_count;

 cgltf_material_variant* variants;
 cgltf_size variants_count;

 cgltf_extras extras;

 cgltf_size data_extensions_count;
 cgltf_extension* data_extensions;

 char** extensions_used;
 cgltf_size extensions_used_count;

 char** extensions_required;
 cgltf_size extensions_required_count;

 const char* json;
 cgltf_size json_size;

 const void* bin;
 cgltf_size bin_size;

 cgltf_memory_options memory;
 cgltf_file_options file;
}

cgltf_result cgltf_parse(
  const cgltf_options* options,
  const void* data,
  cgltf_size size,
  cgltf_data** out_data);

cgltf_result cgltf_parse_file(
  const cgltf_options* options,
  const char* path,
  cgltf_data** out_data);

cgltf_result cgltf_load_buffers(
  const cgltf_options* options,
  cgltf_data* data,
  const char* gltf_path);

cgltf_result cgltf_load_buffer_base64(const cgltf_options* options, cgltf_size size, const char* base64, void** out_data);

cgltf_size cgltf_decode_string(char* string);
cgltf_size cgltf_decode_uri(char* uri);

cgltf_result cgltf_validate(cgltf_data* data);

void cgltf_free(cgltf_data* data);

void cgltf_node_transform_local(const cgltf_node* node, cgltf_float* out_matrix);
void cgltf_node_transform_world(const cgltf_node* node, cgltf_float* out_matrix);

cgltf_bool cgltf_accessor_read_float(const cgltf_accessor* accessor, cgltf_size index, cgltf_float* out_, cgltf_size element_size);
cgltf_bool cgltf_accessor_read_uint(const cgltf_accessor* accessor, cgltf_size index, cgltf_uint* out_, cgltf_size element_size);
cgltf_size cgltf_accessor_read_index(const cgltf_accessor* accessor, cgltf_size index);

cgltf_size cgltf_num_components(cgltf_type type);

cgltf_size cgltf_accessor_unpack_floats(const cgltf_accessor* accessor, cgltf_float* out_, cgltf_size float_count);

cgltf_result cgltf_copy_extras_json(const cgltf_data* data, const cgltf_extras* extras, char* dest, cgltf_size* dest_size);
