{**
 * plugins/generic/jatsParser/templates/articleView.tpl
 *
 * Copyright (c) 2017-2018 Vitalii Bezsheiko
 * Distributed under the GNU GPL v3.
 *
 * @brief Page for displaying JATS XML galley as HTML
 *}

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

{include file="frontend/components/header.tpl" pageTitleTranslated=$article->getLocalizedTitle()|escape}

<div class="jatsParser__container">

	<div class="jatsParser__meta">
		{* Cover image *}
		{if $article->getLocalizedCoverImage() || $issue->getLocalizedCoverImage()}
			<div class="jatsParser__cover-wrapper">
				{if $article->getLocalizedCoverImage()}
					<img class="jatsParser__cover" src="{$article->getLocalizedCoverImageUrl()|escape}"{if $article->getLocalizedCoverImageAltText()} alt="{$article->getLocalizedCoverImageAltText()|escape}"{/if}>
				{else}
					<a href="{url page="issue" op="view" path=$issue->getBestIssueId()}">
						<img class="jatsParser__cover" src="{$issue->getLocalizedCoverImageUrl()|escape}"{if $issue->getLocalizedCoverImageAltText()} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{/if}>
					</a>
				{/if}
			</div>
		{/if}
<!-- rsh getSectionTitle deprecated in 3.2.1-2+ https://github.com/pkp/pkp-lib/issues/6102 -->
       <!-- <div class="jatsParser__meta-row">
            {* DOI (requires plugin) *}
            {foreach from=$pubIdPlugins item=pubIdPlugin}
                {if $pubIdPlugin->getPubIdType() != 'doi'}
                    {continue}
                {/if}
                {assign var=pubId value=$article->getStoredPubId($pubIdPlugin->getPubIdType())}
                {if $pubId}
                    {assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
                    <div class="jatsParser__meta-doi">
                        <span class="jatsParser__doi-label">
                            {capture assign=translatedDOI}{translate key="plugins.pubIds.doi.readerDisplayName"}{/capture}
                            {translate key="semicolon" label=$translatedDOI}
                        </span>
                        <span class="jatsParser__meta-doi-value">
                            <a href="{$doiUrl}">
                                {* maching DOI's (with new and old format) *}
                                {$doiUrl|regex_replace:"/http.*org\//":" "}
                            </a>
                        </span>
                    </div>
                {/if}
            {/foreach}
        </div> -->

		{* Article title *}
		{if $article->getLocalizedFullTitle()}
			<h1 class="jatsParser__meta-title">{$article->getLocalizedFullTitle()|escape}</h1>
		{/if}
	</div>

		{* Keywords *}
		{if !empty($keywords[$currentLocale])}
			<div class="jatsParser__keywords-wrapper">
				<div class="jatsParser__keywords-row">
					{foreach from=$keywords item=keywordArray}
						{foreach from=$keywordArray item=keyword key=k}
								<span class="jatsParser__keyword">{$keyword|escape}</span>
						{/foreach}
					{/foreach}
				</div>
			</div>
		{/if}

	<div class="jatsParser__articleView">
		<div class="jatsParser__left-article-block">
			{if $generatePdfUrl}
				<div class="jatsParser__pdf-link-wrapper">
					<a class="jatsParser__link-pdf" href="{$generatePdfUrl}" title="{translate key="plugins.generic.jatsParser.pdf.read.label"}">
						<span class="jatsParser__link-pdf-text">{translate key="plugins.generic.jatsParser.pdf.read.symbol-text"}</span>
					</a>
				</div>
			{/if}
		</div>
		<div class="jatsParser__center-article-block">
			<div class="jatsParser__article-fulltext" id="jatsParserFullText">
 		
	{* TMR div for hook to js for product citation *}	 
    <div id="jatsParser__related-object" style="padding-left:0;">
</div>
		
		 {* Authors' list *}
                {if $article->getAuthors()}
                <ul style="padding-left:0;">
                                {foreach from=$article->getAuthors() item=authorString key=authorStringKey}
                                        {strip}
		{* Book under Review *}
                     <b>Reviewed by:</b><br/>
                 <span class="jatsParser__meta-author" style="font-weight:normal;">{$authorString->getFullName()|escape}</span>
                        {/strip}{/foreach}
                                {foreach from=$article->getAuthors() item=author key=authorKey}
                {if $author->getLocalizedAffiliation()}
                                <br/><span>{$author->getLocalizedAffiliation()|escape}</span>
                                {/if}
                                {if $author->getLocalizedBiography()}
                                <br/><span>{$author->getLocalizedBiography()|escape}</span>
                                {/if}
                        {/foreach}
                        </ul>

                {/if}
		{$htmlDocument}

			</div>
		</div>
	</div>
</div>

{include file="frontend/components/footer.tpl"}
