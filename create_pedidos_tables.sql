CREATE TABLE IF NOT EXISTS `pedidos_usuario` (
  `id_pedido` int AUTO_INCREMENT PRIMARY KEY,
  `usuario_id` int NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'pendiente',
  `fecha_pedido` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total` decimal(10, 2) NOT NULL DEFAULT 0,
  FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT chk_estado CHECK (`estado` IN ('pendiente', 'confirmado', 'preparando', 'listo', 'cancelado'))
);

CREATE TABLE IF NOT EXISTS `items_pedidos` (
  `id_item` int AUTO_INCREMENT PRIMARY KEY,
  `pedido_id` int NOT NULL,
  `plato_id` int NOT NULL,
  `cantidad` int NOT NULL DEFAULT 1,
  `precio_unitario` decimal(10, 2) NOT NULL,
  FOREIGN KEY (`pedido_id`) REFERENCES `pedidos_usuario` (`id_pedido`) ON DELETE CASCADE,
  FOREIGN KEY (`plato_id`) REFERENCES `platos` (`id_plato`) ON DELETE CASCADE,
  CONSTRAINT chk_cantidad CHECK (`cantidad` > 0)
);
