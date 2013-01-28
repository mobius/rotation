###
Initialize
###
scene = null
camera = null
renderer = null
container = null
cube = null
stats = null
sceneWidth = window.innerWidth/2
sceneHeight = window.innerHeight/2

app_init = -> 	
	container = $('#first')[0]
	$('#first').mousemove (ev) ->
		cube.rotation.y += 0.01*(ev.clientX - sceneWidth)/sceneWidth
		cube.rotation.x += 0.01*(ev.clientY - sceneHeight)/sceneHeight

	scene = new THREE.Scene
	camera = new THREE.PerspectiveCamera 75, window.innerWidth/window.innerHeight, 0.1, 1000
	renderer = new THREE.WebGLRenderer
	renderer.setSize window.innerWidth, window.innerHeight

	container.appendChild renderer.domElement

	#--- Grid --- #
	
	size = 500
	step = 20
	grid = new THREE.Geometry

	for i in [-size..size] by step
		grid.vertices.push new THREE.Vector3 -size, 0, i
		grid.vertices.push new THREE.Vector3 size, 0, i
		grid.vertices.push new THREE.Vector3 i, 0, -size
		grid.vertices.push new THREE.Vector3 i, 0, size
	
	grid_material = new THREE.LineBasicMaterial {color:0xffffff, opacity:0.2}
	line = new THREE.Line grid, grid_material
	line.type = THREE.LinePieces;
	scene.add line

	###
	Geometry
	###
	geometry = new THREE.CubeGeometry 10,10,10
	material = new THREE.MeshBasicMaterial {color: 0xff0000}
	cube = new THREE.Mesh geometry, material
	stats = new Stats
	stats.domElement.style.position = 'absolute'
	stats.domElement.style.top = '0px'
	container.appendChild stats.domElement

	#scene.add cube

	axis = new THREE.AxisHelper 10, 10, 10
	scene.add axis

	camera.position = new THREE.Vector3 10, 20, 30
	camera.lookAt(scene.position)
	

###
Update
###
app_render = ->
	requestAnimationFrame app_render
	stats.update()

	renderer.render scene, camera
	


$(document).bind 'ready', ->
	app_init()
	app_render()