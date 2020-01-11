/**
 * Template result of data
 * @param {array} data 
 * @param {string} target 
 */
function listItem(data, target = '#results'){
    const $template = `<div class="disease bg-white p-3 border rounded mb-2">
                        <div class="d-flex justify-content-between mb-1 border-bottom">
                            <h5 for="font-weight-bold mb-0">${data.name}</h5>
                            <div class="right">
                                Bayes: <span class="text-primary">${data.bayes}%</span>
                            </div>
                        </div>
                        <label class="font-weight-bold text-muted mb-0">Solusi:</label>
                        <article>${data.solution.solutions}</article>
                    </div>`;
    $(target).append($template);
}

exports.listItem = listItem;