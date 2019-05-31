import Sortable from 'sortablejs';

  const initSortable = () => {
    const results = document.querySelector('#friends');
    Sortable.create(results, {

      ghostClass: "ghost",
      group: "teams",
      animation: 150,
      onEnd: (event) => {
        alert(`${event.oldIndex} moved to ${event.newIndex}`);
      }
    });
    const team = document.querySelector('#team');
    Sortable.create(team, {
      pull: false,
      sort: false,
      group: "teams",
      animation: 150,
    });
  };

export { initSortable };

