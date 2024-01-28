<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#background-video {
	width: 100vw;
	height: 100vh;
	object-fit: cover;
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	z-index: -1;
	opacity: 0.5;
}
a:hover{
cursor:pointer;
position: relative;
top:-5px;
left:-5px;
}
</style>
</head>
<body>
	<!-- The video -->
	<video autoplay muted loop id="background-video">
		<source src="pokemonListBackground.mp4" type="video/mp4">
	</video>
	<!-- The video -->
	<c:forEach var="i" begin="1" end="1017">
		<a href="add.do?spriteIdHomeAdd=${i}"><img
			src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${i}.png"
			width=200px></a>
	</c:forEach>
</body>
</html>