<?php namespace JATSParser\Back;

use JATSParser\Back\AbstractReference as AbstractReference;

class Book extends AbstractReference {

	/* @var $title string */
	protected $title;

	/* @var $publisherLoc string */
	protected $publisherLoc;

	/* @var $publisherName string */
	protected $publisherName;

    	/* @var $series string */
    	protected $series;

 	/* @var $price string */
 	protected $pages;

 	/* @var $price string */
 	protected $price;

 	/* @var $isbn string */
 	protected $isbn;

	public function __construct(\DOMElement $reference) {

		parent::__construct($reference);

		$this->title = $this->extractFromElement($reference, ".//source[1]");
		$this->publisherLoc = $this->extractFromElement($reference, ".//publisher-loc[1]");
		$this->publisherName = $this->extractFromElement($reference, ".//publisher-name[1]");
		$this->series = $this->extractFromElement($reference, ".//series[1]");
		$this->url = $this->extractFromElement($reference, ".//ext-link[1]");
		$this->pages = $this->extractFromElement($reference, ".//page-range[1]");
		$this->price = $this->extractFromElement($reference, ".//price[1]");
		$this->isbn = $this->extractFromElement($reference, ".//isbn[1]");
	}

	/**
	 * @return string
	 */
	public function getId(): string
	{
		return $this->id;
	}

	/**
	 * @return string
	 */
	public function getTitle(): string 
	{
		return $this->title;
	}

	/**
	 * @return array
	 */
	public function getAuthors(): array
	{
		return $this->authors;
	}

	/**
	 * @return array
	 */
	public function getEditors(): array
	{
		return $this->editors;
	}

	/**
	 * @return string
	 */
	public function getYear(): string
	{
		return $this->year;
	}

	/**
	 * @return string
	 */
	public function getUrl(): string
	{
		return $this->url;
	}

	/**
	 * @return string
	 */
	public function getPublisherLoc(): string
	{
		return $this->publisherLoc;
	}

	/**
	 * @return string
	 */
	public function getPublisherName(): string
	{
		return $this->publisherName;
	}
	/**
	 * @return string
	 */
	public function getPages(): string
	{
		return $this->pages;
	}	

	/**
	 * @return string
	 */
	public function getPrice(): string
	{
		return $this->price;
	}

	/**
	 * @return string
	 */
	public function getIsbn(): string
	{
		return $this->isbn;
	}
	/**
	 * @return array
	 */
	public function getPubIdType(): array
	{
		return $this->pubIdType;
	}
}
