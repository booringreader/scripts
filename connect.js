Connect = {
    config: {
        scrollDelay: 2000,
        actionDelay: 3000,
        nextPageDelay: 5000,
        maxRequests: -1,
        addNote: false,
    },

    initialize(config, data) {
        console.log("LOG: crawler initialized");
        console.debug("DEBUG: scrolling to bottom in" + this.scrollDelay / 100 + "s");
        setTimeout(
            () => this.scrollBottom(config, data),
            config.scrollDelay
        );
    },

    //! scroll to map the entire window
    scrollBottom(config, data){
        window.scrollTo({
            top: document.body.scrollHeight,
            behavior: "smooth"
        });
        console.debug("DEBUG: scrolling back to the top in" + this.scrollDelay / 100 + " s");
        setTimeout(() => this.scrollTop(config, data),
            config.scrollDelay
        );
    },

    scrollTop(config, data){
        window.scrollTo({
            top: 0,
            behavior: "smooth"
        });
        console.debug("DEBUG")
        setTimeout(() => this.scout(config, data), config.scrollDelay)
    },

    //! begin process
    scout(config, data){
        var totalRows = this.totalRows(); // total divs
        if (totalRows >= 0) {
            this.compile(config, data);
        } else {
            console.warn("WARN: end of search results");
            this.complete(config);
        }
    },

    compile(config, data){
        var elements = document.querySelectorAll("button"); // store all elements with type button
        data.pageButtons = [...elements].filter(
            (element) => {
                return element.textContent.trim() === "Connect";
            }); // convert into array and find out only the ones with value = Connect

        if (!data.pageButtons || data.pageButtons.length === 0) {
            console.warn("ERROR: no connect buttons found on this page");
            console.info("INFO: moving to next page");
            setTimeout(() => {
                this.nextPage(config, data)
            }, config.nextPageDelay);
        } else {
            data.pageButtonTotal = data.pageButtons.length;
            console.info("INFO: " + data.pageButtonTotal + "connect buttons found");
            data.pageButtonIndex = 0;
            //? collect names for personalized message
            var names = document.getElementsByClassName("entity-result__title-line");
            names = [...names].filter(
                (element) => {
                    return element.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.textContent.includes(
                        "Connect\n"
                    );
                });
            data.connectNames = [...names].map(
                (element) => {
                    return element.innerText.split(" ")[0];
                });
            console.debug("DEBUG: starting to send invites in " + config.actionDelay / 100 + " s");
            setTimeout(() => {
                this.sendInvites(config, data);
            }, config.actionDelay);
        }
    },

    //? if no. of requests not maxed out, send more by clicking the button, then
    //? add note if note exists or execute done function to mark completion
    sendInvites(config, data){
        if (config.maxRequests == 0) {
            console.info("INFO: max requests reached for the script run!");
            this.complete(config);
        }else{
            var button = data.pageButtons[data.pageButtonIndex];
            button.click();
            if(config.addNote && config.note){
                setTimeout(() => this.clickAddNote(config, data), config.actionDelay);
            }else{
                setTimeout(() => this.clickDone(config, data), config.actionDelay)
            }
        }
    },

    //? get all buttons, filter out only the ones with "Add a note"
    //? if such a button exists then click and paste note
    //? else move on
    clickAddNote(config, data){
        var buttons = document.querySelectorAll("button");
        var addNoteButton = Array.prototype.filter.call(buttons, 
            (element) => {
                return element.textContent.trim() === "Send without a note"
            }
        );
        if(addNoteButton && addNoteButton[0]){
            addNoteButton[0].click();
            setTimeout(() => this.pasteNote(config, data), config.actionDelay);
        }else{
            setTimeout(() => {
               this.complete(); 
            }, config.actionDelay);
        }

    },

    pasteNote(config, data){
        noteTextBox = document.getElementById("custom-message") // linkedIn might change id and class names
        noteTextBox.value = config.note.replace("{{name}}", data.connectNames[data.pageButtonIndex]);
        noteTextBox.dispatchEvent(
            new Event("input", {bubbles: true})
        );
        setTimeout(() => this.clickDone(config, data), config.actionDelay)
    },

    clickDone(config, data){
        var buttons = document.querySelectorAll("button")
        var doneButton = Array.prototype.filter.call(buttons, (element) => {
            return element.textContent.trim() === "Send";
        })
        if (doneButton && doneButton[0]){
            doneButton[0].click();
        }else{
            console.debug("DEBUG: send button not found")
        }
        setTimeout(() => {
           this.clickClose(config, data)
        }, config.actionDelay);
    },

    clickClose(config, data){
        var closeButton = document.getElementsByClassName("artdeco-modal__dismiss artdeco-button artdeco-button--circle artdeco-button--muted artdeco-button--2 artdeco-button--tertiary ember-view"
        )
        if(closeButton && closeButton[0]){
            closeButton[0].click();
        }
        config.maxRequests--;
        if(data.pageButtonIndex === data.pageButtonTotal -1){
            setTimeout(() =>
               this.nextPage(config), config.actionDelay);
        }else{
            data.pageButtonIndex++
            setTimeout(() => this.sendInvites(config, data), config.actionDelay)
        }
    },
    nextPage(config){
        var pageButton = document.getElementsByClassName("artdeco-pagination__button--next")
        if(!pageButton || pageButton.length === 0 || pageButton[0].hasAttribute("disabled")){
            return this.complete(config);
        } 
        pageButton[0].click();
        setTimeout(() => {
           this.initialize(config, {}) 
        }, config.nextPageDelay);
    },
    complete(config){
        console.info("INFO: end")
    },
    totalRows(config){
        var search_results = document.getElementsByClassName("search-result-container");
        if(search_results && search_results.length != 0){
            return search_results.length;
        }else{
            return 0
        }
    }
}

Connect.initialize(Connect.config, {});


//? configuration data for the class
//? initialisation message
//? scroll to bottom of the page, then to the top of the page, to make sure all the profiles are loaded

//* TODO
// change classnames for updated linkedIn site
// send without a note button
// reduce action delay
