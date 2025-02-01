package com.ecommerce.monolith.repository;

import com.ecommerce.monolith.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    // Custom queries can go here (if needed)
}
