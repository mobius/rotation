###
Initialize
###
scene = null
camera = null
renderer = null
container = null
cube = null
stats = null

app_init = -> 	
	container = $('#first')[0]
	$('#first').mousemove (ev) ->
		camera.position.x += ev.clientX - window.innerWidth/2
		camera.position.y += ev.clientY - window.innerHeight/2
		camera.lookAt(scene.position)

	scene = new THREE.Scene
	camera = new THREE.PerspectiveCamera 75, window.innerWidth/window.innerHeight, 0.1, 1000
	renderer = new THREE.WebGLRenderer
	renderer.setSize window.innerWidth, window.innerHeight

	container.appendChild renderer.domElement

	geometry = new THREE.CubeGeometry 1,1,1
	material = new THREE.MeshBasicMaterial {color: 0xff0000}
	cube = new THREE.Mesh geometry, material
	stats = new Stats
	stats.domElement.style.position = 'absolute'
	stats.domElement.style.top = '0px'
	container.appendChild stats.domElement

	scene.add cube
	camera.position.z = 5

	

###
Update
###
app_render = ->
	requestAnimationFrame app_render
	stats.update()

	renderer.render scene, camera
	


