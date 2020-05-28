package co.grandcircus.lab24.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.lab24.entity.Party;


public interface PartyRepository extends JpaRepository<Party, Long> {
	
	List<Party> findByNameContainingIgnoreCase(String name);

}
