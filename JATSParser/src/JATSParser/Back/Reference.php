<?php namespace JATSParser\Back;

interface Reference {

	public function getId();

	public function getTitle();

	public function getAuthors();

	public function getEditors();

	public function getYear();

	public function getPages();

	public function getPrice();

	public function getIsbn();

}